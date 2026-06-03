package flixel.engine.menus.editor;

import flixel.engine.play.PlayState;
import flixel.engine.play.nodes.button.ButtonIconSpriteNode;
import flixel.engine.play.nodes.button.ButtonSpriteNode;
import flixel.engine.play.nodes.sprite.ToolbarNode;
import flixel.engine.play.nodes.text.TextNode;
import flixel.engine.util.Constants;
import flixel.util.FlxColor;

class EditorToolbar extends ToolbarNode
{
	public var leaveIcon:ButtonIconSpriteNode;
	public var githubIcon:ButtonIconSpriteNode;

	public var watermarkText:TextNode;

	override public function new(width:Int)
	{
		super(width, 48);

		_bg.alpha = .5;
	}

	override function create()
	{
		super.create();

		watermarkText = new TextNode(0, 24, 'FlxEngine v${Constants.VERSION_FULL}', 16);
		watermarkText.y = watermarkText.height / 2;
		watermarkText.scrollFactor.set();

		githubIcon = new ButtonIconSpriteNode('toolbar/github', 8, 8);
		githubIcon.onClicked = onGithubIconClicked;
		githubIcon.scrollFactor.set();

		leaveIcon = new ButtonIconSpriteNode('toolbar/X', 8, 8);
		leaveIcon.onClicked = onLeaveIconClicked;
		leaveIcon.color = FlxColor.RED;
		leaveIcon.scrollFactor.set();

		leaveIcon.x = _bg.width - (leaveIcon.width + 16);
		githubIcon.x = leaveIcon.x - githubIcon.width - 16;

		add(githubIcon);
		add(leaveIcon);
	}

	function onLeaveIconClicked(icon:ButtonSpriteNode)
	{
		if (cast(FlxG.state, EditorState) != null)
			Sys.exit(0);

		if (cast(FlxG.state, PlayState) != null)
			FlxG.switchState(() -> new EditorState());
	}

	function onGithubIconClicked(icon:ButtonSpriteNode)
	{
		FlxG.openURL('https://github.com/bopel-maki-macohi/FlxEngine');
	}

	override function update(elapsed:Float)
	{
		watermarkText.x = this.x;
		watermarkText.y = this.y + watermarkText.height / 2;

		super.update(elapsed);
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
