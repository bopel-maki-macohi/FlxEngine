package flixel.engine.play.nodes.script;

class ScriptGroupNode
{
	public var nodes:Array<ScriptNode> = [];

	public var variables:Map<String, Dynamic> = [];

	public function new() {}

	public function add(node:ScriptNode)
	{
		if (node == null)
			return;
		if (nodes.indexOf(node) > -1)
			return;

		for (key => value in variables)
			node.set(key, value, getAllowOverride(key));

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
		if (getAllowOverride(variable) || !variables.exists(variable))
			variables.set(variable, value);

		for (node in nodes)
			node.set(variable, value, getAllowOverride(variable));
	}

	public function get(variable:String)
	{
		for (node in nodes)
			if (node.get(variable) != null)
				return node.get(variable);

		return null;
	}

	public dynamic function getAllowOverride(variable:String):Bool
	{
		return true;
	}
}
