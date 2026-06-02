package flixel.engine.editor;

import flixel.util.FlxColor;

class EditorState extends FlxState
{
	var editorCamera:FlxCamera;

	override function create()
	{
		super.create();

		trace('Hello World!');

		editorCamera = new FlxCamera();
		FlxG.cameras.add(editorCamera, true);
		editorCamera.bgColor = FlxColor.GRAY;
		editorCamera.bgColor.brightness *= 0.25;
	}
}
