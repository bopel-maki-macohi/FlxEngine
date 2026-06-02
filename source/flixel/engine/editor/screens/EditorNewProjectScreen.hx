package flixel.engine.editor.screens;

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

	override function create()
	{
		super.create();

		label = new FlxText(0, parent.leaveIcon.y + parent.leaveIcon.height, FlxG.width, 'NEW PROJECT', 32);
		add(label);
		label.alignment = CENTER;

		projectNameInput = new FlxInputText(0, 0, FlxG.width / 2, '', 16);
		add(projectNameInput);
		projectNameInput.screenCenter(X);
		projectNameInput.y = label.y + (projectNameInput.height * 4);

		projectNameLabel = new FlxText(projectNameInput.x, projectNameInput.y - 24, 0, 'Project Name', 16);
		add(projectNameLabel);
	}
}
