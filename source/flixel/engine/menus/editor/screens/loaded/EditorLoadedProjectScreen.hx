package flixel.engine.menus.editor.screens.loaded;

import flixel.engine.play.nodes.button.ButtonNode;

class EditorLoadedProjectScreen extends EditorScreen
{
	override public function new(parent:EditorState)
	{
		super('editor.projectLoaded', parent);
	}

	var back:ButtonNode;

	override function create()
	{
		super.create();

		back = new ButtonNode(0, 0, 'Back', () -> parent.setCurrentScreen(parent.screen_noProject.id));
		add(back);
		back.screenCenter();
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
