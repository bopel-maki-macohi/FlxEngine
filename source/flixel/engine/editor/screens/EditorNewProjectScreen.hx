package flixel.engine.editor.screens;

import flixel.text.FlxInputText;

class EditorNewProjectScreen extends EditorScreen
{
	override public function new(parent:EditorState)
	{
		super('editor.newProject', parent);
	}

	var projectName:FlxInputText;

	override function create()
	{
		super.create();

		projectName = new FlxInputText(0, 0, FlxG.width / 2, 'Project Name', 16);
		add(projectName);
		projectName.screenCenter();
	}
}
