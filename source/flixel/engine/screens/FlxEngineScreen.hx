package flixel.engine.screens;

class FlxEngineScreen<T> extends FlxState
{
	public var id(default, null):String;
	public var parent(default, null):T;

	override public function new(id:String, parent:T)
	{
		super();

		this.id = id;
		this.parent = parent;
	}
}
