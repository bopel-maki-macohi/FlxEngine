package flixel.engine.menus.editor.screens;

import flixel.engine.graphics.FlxEngineButton;

class EditorLoadProjectScreen extends EditorScreen
{
	override public function new(parent:EditorState)
	{
		super('editor.loadProject', parent);
	}

	var back:FlxEngineButton;

	override function create()
	{
		super.create();

		back = new FlxEngineButton(0, 0, 'Back', () -> parent.setCurrentScreen(parent.screen_noProject.id));
		add(back);
		back.screenCenter();
	}
}
