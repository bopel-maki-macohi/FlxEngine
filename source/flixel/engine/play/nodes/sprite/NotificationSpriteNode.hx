package flixel.engine.play.nodes.sprite;

import flixel.engine.play.nodes.button.ButtonIconSpriteNode;
import flixel.engine.play.nodes.text.TextNode;
import flixel.util.FlxColor;

class NotificationSpriteNode extends SpriteNode
{
	public var bg:SpriteNode;
	public var text:TextNode;
	public var icon:ButtonIconSpriteNode;

	public function new(notification:String, icon:String)
	{
		super();

		bg = new SpriteNode();
		text = new TextNode(0, 0, 0, notification, 16);
		this.icon = new ButtonIconSpriteNode(icon);

		bg.makeGraphic(Math.floor(text.width * 1.1 + this.icon.width * 1.1), Math.floor(text.height * 1.1), FlxColor.WHITE);
	}

	override function update(elapsed:Float)
	{
		bg.setPosition(x, y);

		icon.x = bg.x + icon.width / 10;
		icon.y = bg.y + icon.height / 2;

		text.x = icon.x + icon.width + (text.width / 10);
		text.y = bg.y + text.height / 2;
	}

	override function draw()
	{
		for (asset in [bg, text, icon])
			if (asset != null && asset.visible)
			{
				asset.cameras = _cameras;
				asset.draw();
			}
	}

	#if FLX_DEBUG
	override function drawDebug()
	{
		for (asset in [bg, text, icon])
			if (asset != null)
				asset.drawDebug();
	}
	#end
}
