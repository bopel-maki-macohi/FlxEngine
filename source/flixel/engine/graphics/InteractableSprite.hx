package flixel.engine.graphics;

class InteractableSprite extends FlxEngineSprite
{
	public var onClicked:InteractableSprite->Void;

	public var icon:String;

	override public function new(icon:String, x:Float = 0, y:Float = 0, ?scale:Float)
	{
		super(x, y, AssetPaths.png(AssetPaths.getEditorPath('ui/icons/$icon')), scale);

		this.icon = icon;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(this))
		{
			alpha = 1;

			if (FlxG.mouse.justPressed && onClicked != null)
				onClicked(this);
		}
		else
		{
			alpha = 0.75;
		}
	}
}
