package flixel.engine.screens;

class FlxEngineScreen extends FlxState
{
	public var id(default, null):String;

	override public function new(id:String)
	{
		super();

		this.id = id;
	}
}
