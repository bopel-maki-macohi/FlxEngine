package flixel.engine.events;

class FlxEngineEvent<T>
{
	public var id(default, null):String;
	public var data(default, null):T;

	public function new(id:String, data:T)
	{
		this.id = id;
		this.data = data;
	}
}
