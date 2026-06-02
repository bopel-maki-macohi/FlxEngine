package flixel.engine.editor.screens;

import flixel.engine.graphics.FlxEngineButton;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.text.FlxInputText;

class EditorNewProjectScreen extends EditorScreen
{
	override public function new(parent:EditorState)
	{
		super('editor.newProject', parent);
	}

	var label:FlxText;

	var projectNameInput:FlxInputText;
	var projectNameLabel:FlxText;

	var createButton:FlxEngineButton;

	override function create()
	{
		super.create();

		label = new FlxText(0, parent.leaveIcon.y + parent.leaveIcon.height, FlxG.width, 'NEW PROJECT', 32);
		add(label);
		label.alignment = CENTER;

		projectNameInput = new FlxInputText(0, 0, FlxG.width / 2, '', 16);
		add(projectNameInput);
		projectNameInput.screenCenter();

		projectNameLabel = new FlxText(projectNameInput.x, projectNameInput.y - 24, 0, 'Project Name', 16);
		add(projectNameLabel);

		createButton = new FlxEngineButton(0, 0, 'Create Project', onCreateClicked);
		add(createButton);
		createButton.screenCenter(X);
		createButton.y = FlxG.height - createButton.height * 2;
	}

	function onCreateClicked() {}
}
