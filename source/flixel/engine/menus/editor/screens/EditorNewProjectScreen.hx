package flixel.engine.menus.editor.screens;

import flixel.engine.graphics.FlxEngineInputLabelText;
import flixel.engine.graphics.FlxEngineButton;
import flixel.text.FlxText;

class EditorNewProjectScreen extends EditorScreen
{
	override public function new(parent:EditorState)
	{
		super('editor.newProject', parent);
	}

	var label:FlxText;

	var projectNameInput:FlxEngineInputLabelText;
	var projectAuthorInput:FlxEngineInputLabelText;
	var projectDescriptionInput:FlxEngineInputLabelText;

	var createButton:FlxEngineButton;

	override function create()
	{
		super.create();

		label = new FlxText(0, parent.leaveIcon.y + parent.leaveIcon.height, FlxG.width, 'NEW PROJECT', 32);
		add(label);
		label.alignment = CENTER;

		projectNameInput = new FlxEngineInputLabelText(0, 0, FlxG.width / 2, 'Project Name', 16);
		add(projectNameInput);
		projectNameInput.screenCenter();
		projectNameInput.y -= projectNameInput.height * 2;

		projectAuthorInput = new FlxEngineInputLabelText(0, 0, FlxG.width / 2, 'Project Author', 16);
		add(projectAuthorInput);
		projectAuthorInput.screenCenter(X);
		projectAuthorInput.y = projectNameInput.y + projectAuthorInput.height;

		projectDescriptionInput = new FlxEngineInputLabelText(0, 0, FlxG.width / 2, 'Project Description', 16);
		add(projectDescriptionInput);
		projectDescriptionInput.fieldHeight = FlxG.height / 4;
		projectDescriptionInput.screenCenter(X);
		projectDescriptionInput.y = projectAuthorInput.y + projectAuthorInput.height;
		projectDescriptionInput.wordWrap = projectDescriptionInput.multiline = true;

		createButton = new FlxEngineButton(0, 0, 'Create Project', onCreateClicked);
		add(createButton);
		createButton.screenCenter(X);
		createButton.y = FlxG.height - createButton.height * 2;
	}

	function onCreateClicked() {}
}
