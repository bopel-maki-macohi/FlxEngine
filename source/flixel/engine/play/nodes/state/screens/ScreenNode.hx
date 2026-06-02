package flixel.engine.play.nodes.state.screens;

class ScreenNode<T> extends StateNode
{
	public var id(default, null):String;
	public var parent(default, null):T;

	override public function new(id:String, parent:T)
	{
		super();

		this.id = id;
		this.parent = parent;
	}

	public function onOpen() {}

	public function onClosed() {}

	public function onAdded() {}

	public function onRemoved() {}
}
