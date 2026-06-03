package flixel.engine.play.nodes.event.ui;

import flixel.engine.play.nodes.event.EventNode;

typedef ScreenChangeEventData =
{
	var previousScreen:String;
	var newScreen:String;
}

class ScreenChangeEventNode extends EventNode<ScreenChangeEventData>
{
	override public function new(data:ScreenChangeEventData)
	{
		super(data);
	}
}
