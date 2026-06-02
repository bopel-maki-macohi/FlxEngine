package flixel.engine.menus.editor;

import flixel.engine.util.Constants;
import flixel.engine.menus.editor.screens.notloaded.*;
import flixel.engine.menus.editor.screens.loaded.*;
import flixel.engine.screens.FlxEngineScreenState;
import flixel.text.FlxText;
import flixel.engine.graphics.InteractableSprite;
import flixel.util.FlxColor;

class EditorState extends FlxEngineScreenState<EditorState>
{
	public var editorCamera:FlxCamera;

	public var leaveIcon:InteractableSprite;

	public var project:EditorProject = new EditorProject();

	public var screen_noProject:EditorNoProjectScreen;
	public var screen_newProject:EditorNewProjectScreen;
	public var screen_loadProject:EditorLoadProjectScreen;

	public var screen_project:EditorLoadedProjectScreen;

	override function create()
	{
		leaveIcon = new InteractableSprite('X', 8, 8);

		editorCamera = new FlxCamera();
		FlxG.cameras.add(editorCamera, true);

		addScreen(screen_loadProject = new EditorLoadProjectScreen(this));
		addScreen(screen_newProject = new EditorNewProjectScreen(this));
		addScreen(screen_noProject = new EditorNoProjectScreen(this));

		addScreen(screen_project = new EditorLoadedProjectScreen(this));

		super.create();

		trace('Hello World!');

		editorCamera.bgColor = FlxColor.GRAY;
		editorCamera.bgColor.brightness *= 0.25;

		add(leaveIcon);
		leaveIcon.onClicked = onLeaveIconClicked;
		leaveIcon.color = FlxColor.RED;
		leaveIcon.scrollFactor.set();

		watermarkText = new FlxText(0, 0, FlxG.height, 'FlxEngine v${Constants.VERSION_FULL}', 16);
		watermarkText.y = FlxG.height - watermarkText.height;
		add(watermarkText);
		watermarkText.scrollFactor.set();

		if (project.name == null)
			setCurrentScreen(screen_noProject.id);
		else
			setCurrentScreen(screen_project.id);
	}

	function onLeaveIconClicked(icon:InteractableSprite)
	{
		Sys.exit(0);
	}
}
