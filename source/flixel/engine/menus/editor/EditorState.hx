package flixel.engine.menus.editor;

import flixel.engine.menus.editor.screens.loaded.*;
import flixel.engine.menus.editor.screens.notloaded.*;
import flixel.engine.play.nodes.button.ButtonSpriteNode;
import flixel.engine.play.nodes.state.screens.StateScreenNode;
import flixel.util.FlxColor;

class EditorState extends StateScreenNode<EditorState>
{
	public var editorCamera:FlxCamera;

	public var toolbar:EditorToolbar;

	public var project:EditorProject = new EditorProject();

	public var screen_noProject:EditorNoProjectScreen;
	public var screen_newProject:EditorNewProjectScreen;
	public var screen_loadProject:EditorLoadProjectScreen;

	public var screen_project:EditorLoadedProjectScreen;

	override function create()
	{
		toolbar = new EditorToolbar(FlxG.width);

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

		add(toolbar);
		toolbar.scrollFactor.set();

		if (project.name == null)
			setCurrentScreen(screen_noProject.id);
		else
			setCurrentScreen(screen_project.id);
	}

	function onLeaveIconClicked(icon:ButtonSpriteNode)
	{
		Sys.exit(0);
	}
}
