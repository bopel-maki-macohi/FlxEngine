package flixel.engine.editor;

import flixel.engine.util.Constants;
import flixel.engine.editor.screens.*;
import flixel.engine.screens.FlxEngineScreenState;
import flixel.text.FlxText;
import flixel.engine.editor.ui.EditorIcon;
import flixel.util.FlxColor;

class EditorState extends FlxEngineScreenState<EditorState>
{
	var editorCamera:FlxCamera;

	var leaveIcon:EditorIcon;

	public var screen_noProject:EditorNoProjectScreen;
	public var screen_newProject:EditorNewProjectScreen;
	public var screen_loadProject:EditorLoadProjectScreen;

	override function create()
	{
		addScreen(screen_noProject = new EditorNoProjectScreen(this));
		addScreen(screen_newProject = new EditorNewProjectScreen(this));
		addScreen(screen_loadProject = new EditorLoadProjectScreen(this));

		super.create();

		trace('Hello World!');

		editorCamera = new FlxCamera();
		FlxG.cameras.add(editorCamera, true);
		editorCamera.bgColor = FlxColor.GRAY;
		editorCamera.bgColor.brightness *= 0.25;

		leaveIcon = new EditorIcon('X', 8, 8);
		add(leaveIcon);
		leaveIcon.onClicked = onLeaveIconClicked;

		watermarkText = new FlxText(0, 0, FlxG.height, 'FlxEngine v${Constants.VERSION_FULL}', 16);
		watermarkText.y = FlxG.height - watermarkText.height;
		add(watermarkText);

		setCurrentScreen(screen_noProject.id);
	}

	function onLeaveIconClicked(icon:EditorIcon)
	{
		Sys.exit(0);
	}
}
