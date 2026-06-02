package flixel.engine.menus.editor;

import flixel.engine.play.nodes.button.ButtonIconSpriteNode;
import flixel.engine.play.nodes.button.ButtonSpriteNode;
import flixel.engine.play.nodes.sprite.ToolbarNode;
import flixel.util.FlxColor;

class EditorToolbar extends ToolbarNode
{
	var parent:EditorState;

	public var leaveIcon:ButtonIconSpriteNode;

	override public function new(parent:EditorState, width:Int)
	{
		super(width, 48);

		_bg.alpha = .5;

		this.parent = parent;
	}

	override function create()
	{
		super.create();

		leaveIcon = new ButtonIconSpriteNode('X', 8, 8);
		add(leaveIcon);
		leaveIcon.onClicked = onLeaveIconClicked;
		leaveIcon.color = FlxColor.RED;
		leaveIcon.scrollFactor.set();

		leaveIcon.x += 268;
	}

	function onLeaveIconClicked(icon:ButtonSpriteNode)
	{
		Sys.exit(0);
	}
}
