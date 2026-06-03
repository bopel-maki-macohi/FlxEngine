package flixel.engine.editor.screens.loaded;

import haxe.io.Path;
import sys.io.Process;
import flixel.engine.play.PlayState;
import flixel.engine.play.nodes.button.ButtonIconSpriteNode;
import flixel.engine.play.nodes.button.ButtonNode;
import flixel.engine.play.nodes.sprite.PopupSpriteNode;
import flixel.engine.play.nodes.text.InputLabelNode;
import flixel.engine.play.nodes.text.TextNode;
import flixel.engine.util.FileUtil;
import flixel.engine.util.WindowUtil;
import flixel.text.FlxInputText.FlxInputTextChange;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

using StringTools;

class EditorLoadedProjectScreen extends EditorScreen
{
	override public function new(parent:EditorState)
	{
		super('editor.projectLoaded', parent);
	}

	var projectLabel:TextNode;

	var projectAuthorInput:InputLabelNode;
	var projectDescriptionInput:InputLabelNode;

	var openProject:ButtonNode;
	var playProject:ButtonNode;
	var closeProject:ButtonNode;

	var autosaveTimer:FlxTimer;

	override function create()
	{
		super.create();

		projectLabel = new TextNode(0, 0, 0, '', 32);
		add(projectLabel);

		projectAuthorInput = new InputLabelNode(0, 0, FlxG.width / 2, 'Project Author', 16);
		add(projectAuthorInput);

		projectDescriptionInput = new InputLabelNode(0, 0, FlxG.width / 2, 'Project Description', 16);
		add(projectDescriptionInput);
		projectDescriptionInput.fieldHeight = FlxG.height / 4;
		projectDescriptionInput.wordWrap = projectDescriptionInput.multiline = true;

		projectAuthorInput.onTextChange.add(onAuthorChange);
		projectDescriptionInput.onTextChange.add(onDescriptionChange);

		autosaveTimer = new FlxTimer();

		openProject = new ButtonNode(0, 0, 'Open Project', onOpenProject);
		add(openProject);

		closeProject = new ButtonNode(0, 0, 'Close Project', onCloseProject);
		add(closeProject);

		playProject = new ButtonNode(0, 0, 'Play Project', onPlayProject);
		add(playProject);
	}

	function onAuthorChange(text:String, change:FlxInputTextChange)
		parent.project.author = text;

	function onDescriptionChange(text:String, change:FlxInputTextChange)
		parent.project.description = text;

	function onOpenProject()
	{
		final programPath = Sys.programPath();

		var exePath:String = Path.directory(programPath);
		final projectPath:String = '$exePath/${AssetPaths.getProjectsPath(parent.project.name)}/';

		trace(projectPath);

		FileUtil.openFolder(projectPath, false);
	}

	function onCloseProject()
	{
		parent.project = new EditorProject();
		parent.setCurrentScreen(parent.screen_noProject.id);
	}

	function onPlayProject()
	{
		FlxG.switchState(() -> new PlayState(parent.project));
	}

	override function onOpened()
	{
		super.onOpened();

		projectLabel.text = 'Project: ${parent.project.name}';
		projectLabel.screenCenter();
		projectLabel.y = 0;

		projectAuthorInput.text = parent.project.author;
		projectDescriptionInput.text = parent.project.description;

		projectAuthorInput.screenCenter();
		projectAuthorInput.y = projectLabel.y + projectAuthorInput.height;

		projectDescriptionInput.screenCenter();
		projectDescriptionInput.y = projectAuthorInput.y + projectAuthorInput.height;

		openProject.screenCenter();
		openProject.x -= openProject.width * 2;

		closeProject.screenCenter();
		closeProject.x += openProject.width * 2;

		playProject.screenCenter();

		openProject.y = projectDescriptionInput.y + projectDescriptionInput.height + (openProject.height * 2);
		closeProject.y = projectDescriptionInput.y + projectDescriptionInput.height + (closeProject.height * 2);
		playProject.y = projectDescriptionInput.y + projectDescriptionInput.height + (playProject.height * 2);

		autosaveTimer.start(30, t ->
		{
			trace('Autosaved');
			EditorProject.updateProject(parent.project);

			add(PopupSpriteNode.create('download', popup ->
			{
				remove(popup);
			}));
		}, 0);
	}

	override function onClosed()
	{
		super.onClosed();

		autosaveTimer.cancel();
	}
}
