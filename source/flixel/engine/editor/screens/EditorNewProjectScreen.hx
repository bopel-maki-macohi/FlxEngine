package flixel.engine.editor.screens;

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

		createButton = new FlxEngineButton(0, 0, 'Create Project', onCreateClicked);
		add(createButton);
		createButton.screenCenter(X);
		createButton.y = FlxG.height - createButton.height * 2;
	}

	function onCreateClicked() {}
}
