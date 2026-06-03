package flixel.engine.play.nodes.sprite;

import flixel.engine.play.nodes.button.ButtonIconSpriteNode;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class PopupSpriteNode extends ButtonIconSpriteNode
{
	override public function new(icon:String, ?scale:Float)
	{
		super('popup/$icon', 0, 0, scale);
	}

	public static function create(popupStr:String, ?onComplete:PopupSpriteNode->Void) @:privateAccess
	{
		var popup:PopupSpriteNode = new PopupSpriteNode(popupStr);

		FlxTween.cancelTweensOf(popup);

		popup.targetAlpha = 1;
		
		popup.x = FlxG.width - popup.width * 2;
		popup.y = FlxG.height + popup.height * 2;

		FlxG.sound.play(AssetPaths.audio(AssetPaths.getEditorPath('ui/sounds/popup')));

		FlxTween.tween(popup, {y: FlxG.height - popup.height * 2, targetAlpha: 0}, 5, {
			ease: FlxEase.backOut,
			onComplete: t ->
			{
				if (onComplete != null)
					onComplete(popup);
				popup.destroy();
			}
		});

		return popup;
	}

	override function update(elapsed:Float)
	{
		if (onClicked != null)
			onClicked = null;

		super.update(elapsed);
	}
}
