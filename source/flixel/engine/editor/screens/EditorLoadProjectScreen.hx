package flixel.engine.editor.screens;

import flixel.ui.FlxButton;

class EditorLoadProjectScreen extends EditorScreen
{
	override public function new(parent:EditorState)
	{
		super('editor.loadProject', parent);
	}

	var back:FlxButton;

	override function create()
	{
		super.create();

		back = new FlxButton(0, 0, 'Back', () -> parent.setCurrentScreen(parent.screen_noProject.id));
		add(back);
		back.screenCenter();
	}
}
