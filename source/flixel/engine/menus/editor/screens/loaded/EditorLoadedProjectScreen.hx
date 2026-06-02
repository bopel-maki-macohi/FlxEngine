package flixel.engine.menus.editor.screens.loaded;

import flixel.engine.play.nodes.text.InputLabelNode;
import flixel.engine.play.nodes.text.TextNode;
import flixel.text.FlxInputText.FlxInputTextChange;
import flixel.util.FlxTimer;

class EditorLoadedProjectScreen extends EditorScreen
{
	override public function new(parent:EditorState)
	{
		super('editor.projectLoaded', parent);
	}

	var projectLabel:TextNode;

	var projectAuthorInput:InputLabelNode;
	var projectDescriptionInput:InputLabelNode;

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
	}

	function onAuthorChange(text:String, change:FlxInputTextChange)
		parent.project.author = text;

	function onDescriptionChange(text:String, change:FlxInputTextChange)
		parent.project.description = text;

	override function onOpened()
	{
		super.onOpened();

		projectLabel.text = 'Project: ${parent.project.name}';
		projectLabel.screenCenter();
		projectLabel.y = parent.toolbar.bottom;

		projectAuthorInput.text = parent.project.author;
		projectDescriptionInput.text = parent.project.description;

		projectAuthorInput.screenCenter();
		projectAuthorInput.y = projectLabel.y + projectAuthorInput.height;

		projectDescriptionInput.screenCenter();
		projectDescriptionInput.y = projectAuthorInput.y + projectAuthorInput.height;

		autosaveTimer.start(30, t ->
		{
			trace('Autosaved');
			EditorProject.updateProject(parent.project);
		}, 0);
	}

	override function onClosed()
	{
		super.onClosed();

		autosaveTimer.cancel();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			parent.project = new EditorProject();
			parent.setCurrentScreen(parent.screen_noProject.id);
		}
	}
}
