package flixel.engine.editor;

import flixel.text.FlxText;
import flixel.engine.editor.ui.EditorIcon;
import flixel.util.FlxColor;

class EditorState extends FlxEngineState
{
	var editorCamera:FlxCamera;

	var leaveIcon:EditorIcon;

	var noProjectLoaded:FlxText;

	override function create()
	{
		super.create();

		trace('Hello World!');

		editorCamera = new FlxCamera();
		FlxG.cameras.add(editorCamera, true);
		editorCamera.bgColor = FlxColor.GRAY;
		editorCamera.bgColor.brightness *= 0.25;

		leaveIcon = new EditorIcon('X', 8, 8);
		add(leaveIcon);
		leaveIcon.onClicked = onLeaveIconClicked;

		noProjectLoaded = new FlxText(0, 0, 0, 'No Project Loaded', 16);
		add(noProjectLoaded);
		noProjectLoaded.screenCenter();

		watermarkText = new FlxText(0, 0, FlxG.height, 'FlxEngine v${FlxG.stage.application.meta.get('version')}', 16);
		watermarkText.y = FlxG.height - watermarkText.height;
		add(watermarkText);
	}

	function onLeaveIconClicked(icon:EditorIcon)
	{
		Sys.exit(0);
	}
}
