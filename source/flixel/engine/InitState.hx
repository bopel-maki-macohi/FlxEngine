package flixel.engine;

import flixel.engine.editor.EditorState;
import flixel.FlxState;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		FlxG.switchState(() -> new EditorState());
	}
}
