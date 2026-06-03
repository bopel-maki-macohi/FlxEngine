package flixel.engine.play.nodes.event;

class EventNode<T>
{
	public var id(default, null):String;
	public var data(default, null):T;

	public function new(data:T)
	{
		var claName = Type.getClassName(Type.getClass(this)).split(".");

		this.id = claName[claName.length-1];
		this.data = data;
	}
}
