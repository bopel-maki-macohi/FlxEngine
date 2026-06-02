package flixel.engine.play.nodes.button;

import flixel.engine.play.nodes.sprite.SpriteNode;

class ButtonSpriteNode extends SpriteNode
{
	public var onClicked:ButtonSpriteNode->Void;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(this))
		{
			alpha = 1;

			if (FlxG.mouse.justPressed && onClicked != null)
				onClicked(cast(this, ButtonSpriteNode));
		}
		else
		{
			alpha = 0.5;
		}
	}
}
