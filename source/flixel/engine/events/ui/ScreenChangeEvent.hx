package flixel.engine.events.ui;

typedef ScreenChangeEventData =
{
	var previousScreen:String;
	var newScreen:String;
}

class ScreenChangeEvent extends FlxEngineEvent<ScreenChangeEventData>
{
	override public function new(data:ScreenChangeEventData)
	{
		super('screen-change', data);
	}
}
