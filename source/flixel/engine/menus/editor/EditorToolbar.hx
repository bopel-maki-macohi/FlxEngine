package flixel.engine.menus.editor;

import flixel.engine.play.nodes.button.ButtonIconSpriteNode;
import flixel.engine.play.nodes.button.ButtonSpriteNode;
import flixel.engine.play.nodes.sprite.SpriteNode;
import flixel.engine.play.nodes.sprite.ToolbarNode;
import flixel.engine.play.nodes.text.TextNode;
import flixel.engine.util.Constants;
import flixel.util.FlxColor;

class EditorToolbar extends ToolbarNode
{
	var parent:EditorState;

	public var leaveIcon:ButtonIconSpriteNode;

	public var watermarkText:TextNode;

	override public function new(parent:EditorState, width:Int)
	{
		super(width, 48);

		_bg.alpha = .5;

		this.parent = parent;
	}

	override function create()
	{
		super.create();

		watermarkText = new TextNode(0, 24, 'FlxEngine v${Constants.VERSION_FULL}', 16);
		watermarkText.y = watermarkText.height / 2;
		watermarkText.scrollFactor.set();

		leaveIcon = new ButtonIconSpriteNode('toolbar/X', 8, 8);
		add(leaveIcon);
		leaveIcon.onClicked = onLeaveIconClicked;
		leaveIcon.color = FlxColor.RED;
		leaveIcon.scrollFactor.set();

		leaveIcon.x += watermarkText.width + 8;
	}

	function onLeaveIconClicked(icon:ButtonSpriteNode)
	{
		Sys.exit(0);
	}
	

	override function draw()
	{
		super.draw();
		
		if (watermarkText != null && watermarkText.visible)
		{
			watermarkText.cameras = _cameras;
			watermarkText.draw();
		}
	}

	#if FLX_DEBUG
	override function drawDebug()
	{
		super.drawDebug();
		
		if (watermarkText != null)
			watermarkText.drawDebug();
	}
	#end
}
