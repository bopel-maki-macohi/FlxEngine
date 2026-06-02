package flixel.engine.play.nodes.button;

class ButtonIconSpriteNode extends ButtonSpriteNode
{
	public var icon:String;

	override public function new(icon:String, x:Float = 0, y:Float = 0, ?scale:Float)
	{
		super(x, y, AssetPaths.png(AssetPaths.getEditorPath('ui/icons/$icon')), scale);

		this.icon = icon;
	}
}
