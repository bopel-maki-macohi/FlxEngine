package flixel.engine.editor.ui;

import flixel.engine.assets.AssetPaths;

class EditorIcon extends FlxSprite
{
	public var onClicked:EditorIcon->Void;

	public var icon:String;

	override public function new(icon:String, x:Float = 0, y:Float = 0)
	{
		super(x, y, AssetPaths.png(AssetPaths.getEditorPath('ui/icons/$icon')));

		this.icon = icon;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(this) && FlxG.mouse.justPressed && onClicked != null)
			onClicked(this);
	}
}
