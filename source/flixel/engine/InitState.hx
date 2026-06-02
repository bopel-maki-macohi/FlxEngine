package flixel.engine;

import flixel.engine.editor.EditorState;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		FlxG.switchState(() -> new EditorState());
	}
}
