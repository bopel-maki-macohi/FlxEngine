package flixel.engine.play.nodes.sprite;

import flixel.engine.util.Constants;
import flixel.system.FlxAssets.FlxGraphicAsset;

class SpriteNode extends FlxSprite
{
	override public function new(?x:Float = 0.0, ?y:Float = 0.0, ?simpleGraphic:FlxGraphicAsset, ?scale:Null<Float>)
	{
		super(x, y, simpleGraphic);

		if (graphic != null)
			setScale(scale ?? Constants.DEFAULT_SPRITE_SCALE);
	}

	public function setScale(scale:Float)
	{
		this.scale.set(scale, scale);
		updateHitbox();
	}
}
