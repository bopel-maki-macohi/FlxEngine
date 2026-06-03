package flixel.engine.play.nodes.button;

import flixel.engine.play.nodes.sprite.SpriteNode;
import flixel.math.FlxMath;

class ButtonSpriteNode extends SpriteNode
{
	public var onClicked:ButtonSpriteNode->Void;

	public var targetAlpha:Null<Float> = null;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (onClicked != null)
		{
			if (FlxG.mouse.overlaps(this))
			{
				targetAlpha = 1;

				if (FlxG.mouse.justPressed)
					onClicked(cast(this, ButtonSpriteNode));
			}
			else
				targetAlpha = 0.5;
		}

		if (targetAlpha != null)
			alpha = targetAlpha;
	}
}
