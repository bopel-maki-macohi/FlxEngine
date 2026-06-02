package flixel.engine.menus.editor.screens.loaded;

import flixel.engine.play.nodes.text.TextNode;

class EditorLoadedProjectScreen extends EditorScreen
{
	override public function new(parent:EditorState)
	{
		super('editor.projectLoaded', parent);
	}

	var projectLabel:TextNode;

	override function create()
	{
		super.create();

		projectLabel = new TextNode(0, 0, 0, 'Project: ${parent.project.name}', 32);
		add(projectLabel);
		projectLabel.screenCenter();
		projectLabel.y = parent.toolbar.bottom;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			parent.project = new EditorProject();
			parent.setCurrentScreen(parent.screen_noProject.id);
		}
	}
}
