package flixel.engine.play.nodes.sprite;

import flixel.engine.play.nodes.script.alias.ScriptFlxAxes;
import flixel.engine.util.Constants;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxAxes;

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

	public var targetAlpha:Null<Float> = null;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (targetAlpha != null)
			alpha = targetAlpha;
	}

	/**
	 * Scripting alias for `screenCenter()`
	 */
	public function center(center_x:Bool = true, center_y:Bool = true)
	{
		if (center_x)
			x = (FlxG.width - width) / 2;

		if (center_y)
			y = (FlxG.height - height) / 2;
	}
}
