package flixel.engine.editor.screens.notloaded;

import flixel.engine.play.nodes.button.ButtonNode;
import flixel.engine.play.nodes.text.TextNode;

class EditorNoProjectScreen extends EditorScreen
{
	var noProjectLoaded:TextNode;

	var projectNewButton:ButtonNode;
	var projectLoadButton:ButtonNode;

	override public function new(parent:EditorState)
	{
		super('editor.noProjectLoaded', parent);
	}

	override function create()
	{
		super.create();

		noProjectLoaded = new TextNode(0, 0, 0, 'No Project Loaded', 16);
		add(noProjectLoaded);
		noProjectLoaded.screenCenter();
		noProjectLoaded.y -= noProjectLoaded.height;

		projectNewButton = new ButtonNode(0, 0, 'New Project', onNewProject);
		add(projectNewButton);
		projectNewButton.screenCenter();
		projectNewButton.y += projectNewButton.height;
		projectNewButton.x -= projectNewButton.width;

		projectLoadButton = new ButtonNode(0, 0, 'Load Project', onLoadProject);
		add(projectLoadButton);
		projectLoadButton.screenCenter();
		projectLoadButton.y += projectLoadButton.height;
		projectLoadButton.x += projectLoadButton.width;

		parent.screen_loadProject.reloadProjects();
		if (parent.screen_loadProject.projects.length == 0)
			projectLoadButton.status = DISABLED;
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
