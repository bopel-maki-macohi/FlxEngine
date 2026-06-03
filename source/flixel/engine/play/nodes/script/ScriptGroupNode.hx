package flixel.engine.play.nodes.script;

class ScriptGroupNode
{
	public var nodes:Array<ScriptNode> = [];

	public function new() {}

	public function add(node:ScriptNode)
	{
		if (node == null)
			return;
		if (nodes.indexOf(node) > -1)
			return;

		node.call('onAddedToGroup');
		nodes.push(node);
	}

	public function remove(node:ScriptNode)
	{
		if (nodes.indexOf(node) < 0)
			return;

		node.call('onRemovedFromGroup');
		nodes.remove(node);
	}

	public function call(fun:String, ?args:Array<Dynamic>)
	{
		for (node in nodes)
			node.call(fun, args);
	}

	public function set(variable:String, value:Dynamic)
	{
		for (node in nodes)
			node.set(variable, value, getAllowOverride());
	}

	public function get(variable:String)
	{
		for (node in nodes)
			if (node.get(variable) != null)
				return node.get(variable);

		return null;
	}

	public dynamic function getAllowOverride():Bool
	{
		return true;
	}
}
