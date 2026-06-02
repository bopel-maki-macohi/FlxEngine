package flixel.engine.play.nodes.button;

import flixel.engine.play.nodes.text.TextNode;

class ButtonLabelSpriteNode extends ButtonIconSpriteNode
{
	public var label:TextNode;

	public var labelText(get, set):String;

	function get_labelText():String
	{
		return label.text;
	}

	function set_labelText(label:String):String
	{
		return this.label.text = label;
	}

	override public function new(label:String, icon:String, x:Float = 0, y:Float = 0, ?scale:Float)
	{
		super(icon, x, y, scale);

		this.label = new TextNode(0, 0, 0, label, 16);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		label.x = this.x + this.width;
		label.y = this.y + this.height / 2;
	}

	override function draw()
	{
		super.draw();

		if (label != null && label.visible)
		{
			label.cameras = _cameras;
			label.draw();
		}
	}

	#if FLX_DEBUG
	override public function drawDebug():Void
	{
		super.drawDebug();

		if (label != null)
			label.drawDebug();
	}
	#end

	override function get_height():Float
	{
		if (label != null && label.height > super.get_height())
			return super.get_height() + label.height + (label.size * 2);

		return super.get_height();
	}

	override function get_width():Float
	{
		if (label != null && label.width > super.get_width())
			return label.width;

		return super.get_width();
	}
}
