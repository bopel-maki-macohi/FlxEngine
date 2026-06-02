package flixel.engine.editor.screens;

import flixel.engine.graphics.FlxEngineButton;
import flixel.text.FlxText;

class EditorNoProjectScreen extends EditorScreen
{
	var noProjectLoaded:FlxText;

	var projectNewButton:FlxEngineButton;
	var projectLoadButton:FlxEngineButton;

	override public function new(parent:EditorState)
	{
		super('editor.noProjectLoaded', parent);
	}

	override function create()
	{
		super.create();

		noProjectLoaded = new FlxText(0, 0, 0, 'No Project Loaded', 16);
		add(noProjectLoaded);
		noProjectLoaded.screenCenter();
		noProjectLoaded.y -= noProjectLoaded.height;

		projectNewButton = new FlxEngineButton(0, 0, 'New Project', onNewProject);
		add(projectNewButton);
		projectNewButton.screenCenter();
		projectNewButton.y += projectNewButton.height;
		projectNewButton.x -= projectNewButton.width;

		projectLoadButton = new FlxEngineButton(0, 0, 'Load Project', onLoadProject);
		add(projectLoadButton);
		projectLoadButton.screenCenter();
		projectLoadButton.y += projectLoadButton.height;
		projectLoadButton.x += projectLoadButton.width;
	}

	function onNewProject()
	{
		parent.setCurrentScreen(parent.screen_newProject.id);
	}

	function onLoadProject()
	{
		parent.setCurrentScreen(parent.screen_loadProject.id);
	}
}
