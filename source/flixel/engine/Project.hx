package flixel.engine;

import openfl.display.Sprite;

class Project extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, InitState));
	}
}
