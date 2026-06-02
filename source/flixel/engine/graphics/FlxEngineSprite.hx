package flixel.engine.graphics;

import flixel.system.FlxAssets.FlxGraphicAsset;

class FlxEngineSprite extends FlxSprite
{
	public static final DEFAULT_SCALE:Float = 2;

	override public function new(?x:Float = 0.0, ?y:Float = 0.0, ?simpleGraphic:FlxGraphicAsset, ?scale:Null<Float>)
	{
		super(x, y, simpleGraphic);

        setScale(scale ?? DEFAULT_SCALE);
	}

	public function setScale(scale:Float)
	{
		this.scale.set(scale, scale);
		updateHitbox();
	}
}
