package flixel.engine.play.events;

import flixel.util.FlxSignal.FlxTypedSignal;

typedef FlxEngineEventSignal<T> = FlxTypedSignal<FlxEngineEvent<T>->Void>;

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
