package flixel.engine.play.nodes.text;

import flixel.text.FlxInputTextManager;
import flixel.util.FlxColor;

class InputLabelNode extends InputTextNode
{
	var _label:TextNode;

	public var label(get, set):String;

	function get_label():String
	{
		return _label.text;
	}

	function set_label(label:String):String
	{
		return _label.text = label;
	}

	public function new(x:Float = 0, y:Float = 0, fieldWidth:Float = 0, ?labelText:String, size:Int = 8, textColor:FlxColor = FlxColor.BLACK,
			backgroundColor:FlxColor = FlxColor.WHITE, embeddedFont:Bool = true, ?manager:FlxInputTextManager)
	{
		super(x, y, fieldWidth, '', size, textColor, backgroundColor, embeddedFont, manager);

		_label = new TextNode(0, 0, 0, labelText, 16);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		_label.x = this.x;
		_label.y = this.y - (_label.size * 2);
		_label.fieldWidth = this.fieldWidth;
	}

	override function draw()
	{
		super.draw();

		if (_label != null && _label.visible)
		{
			_label.cameras = _cameras;
			_label.draw();
		}
	}

	#if FLX_DEBUG
	override public function drawDebug():Void
	{
		super.drawDebug();

		if (_label != null)
			_label.drawDebug();
	}
	#end

	override function get_height():Float
	{
		if (_label != null)
			return super.get_height() + _label.height + (_label.size * 2);

		return super.get_height();
	}

	override function get_width():Float
	{
		if (_label != null && _label.width > super.get_width())
			return _label.width;

		return super.get_width();
	}
}
