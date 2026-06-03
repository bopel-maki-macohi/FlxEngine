package flixel.engine.play.nodes.sprite;

import flixel.util.FlxColor;

class ToolbarNode extends SpriteGroupNode
{
	var _bg:SpriteNode;

	var _toolbarWidth:Int;
	var _toolbarHeight:Int;

	override public function new(toolbarWidth:Int, toolbarHeight:Int = 32)
	{
		super();

		_bg = new SpriteNode();
		_bg.makeGraphic(toolbarWidth, toolbarHeight, FlxColor.BLACK);

		this._toolbarWidth = toolbarWidth;
		this._toolbarHeight = toolbarHeight;

		create();
	}

	public function create() {}

	override function draw()
	{
		if (_bg != null && _bg.visible)
		{
			_bg.cameras = _cameras;
			_bg.draw();
		}

		super.draw();
	}

	#if FLX_DEBUG
	override function drawDebug()
	{
		if (_bg != null)
			_bg.drawDebug();

		super.drawDebug();
	}
	#end

	public var bottom(get, never):Float;

	function get_bottom():Float
	{
		return y + height;
	}

	override function get_height():Float
	{
		return ((super.get_height() > _bg.height) ? super.get_height() : _bg.height);
	}
}
