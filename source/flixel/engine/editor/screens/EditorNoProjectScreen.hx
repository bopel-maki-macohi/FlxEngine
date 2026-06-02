package flixel.engine.editor.screens;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.engine.screens.FlxEngineScreen;

class EditorNoProjectScreen extends FlxEngineScreen
{
	var noProjectLoaded:FlxText;
	var projectNewButton:FlxButton;

	override public function new()
	{
		super('editor.noProjectLoaded');
	}

	override function create()
	{
		super.create();

		noProjectLoaded = new FlxText(0, 0, 0, 'No Project Loaded', 16);
		add(noProjectLoaded);
		noProjectLoaded.screenCenter();
		noProjectLoaded.y -= noProjectLoaded.height;

		projectNewButton = new FlxButton(0, 0, 'New Project', onNewProject);
		add(projectNewButton);
		projectNewButton.screenCenter();
		projectNewButton.y += projectNewButton.height;
	}

	function onNewProject() {}
}
