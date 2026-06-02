package flixel.engine.editor;

import flixel.engine.editor.screens.EditorNoProjectScreen;
import flixel.engine.screens.FlxEngineScreenState;
import flixel.text.FlxText;
import flixel.engine.editor.ui.EditorIcon;
import flixel.util.FlxColor;

class EditorState extends FlxEngineScreenState
{
	var editorCamera:FlxCamera;

	var leaveIcon:EditorIcon;

	var screen_noProject:EditorNoProjectScreen;

	override function create()
	{
		addScreen(screen_noProject = new EditorNoProjectScreen());

		super.create();

		trace('Hello World!');

		editorCamera = new FlxCamera();
		FlxG.cameras.add(editorCamera, true);
		editorCamera.bgColor = FlxColor.GRAY;
		editorCamera.bgColor.brightness *= 0.25;

		leaveIcon = new EditorIcon('X', 8, 8);
		add(leaveIcon);
		leaveIcon.onClicked = onLeaveIconClicked;

		watermarkText = new FlxText(0, 0, FlxG.height, 'FlxEngine v${FlxG.stage.application.meta.get('version')}', 16);
		watermarkText.y = FlxG.height - watermarkText.height;
		add(watermarkText);

		setCurrentScreen(screen_noProject.id);
	}

	function onLeaveIconClicked(icon:EditorIcon)
	{
		Sys.exit(0);
	}
}
