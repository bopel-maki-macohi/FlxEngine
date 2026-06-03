package flixel.engine.editor;

import haxe.io.Path;
import flixel.engine.play.PlayState;
import flixel.engine.play.nodes.button.ButtonIconSpriteNode;
import flixel.engine.play.nodes.button.ButtonSpriteNode;
import flixel.engine.play.nodes.sprite.ToolbarNode;
import flixel.engine.play.nodes.text.TextNode;
import flixel.engine.util.Constants;
import flixel.util.FlxColor;

using StringTools;

class EditorToolbar extends ToolbarNode
{
	public var leaveIcon:ButtonIconSpriteNode;
	public var githubIcon:ButtonIconSpriteNode;
	public var reloadIcon:ButtonIconSpriteNode;

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

		reloadIcon = new ButtonIconSpriteNode('toolbar/reload', 8, 8);

		if (Constants.CURRENT_STATE == 'PlayState')
			reloadIcon.onClicked = onReloadIconClicked;
		else
			reloadIcon.targetAlpha = 0.25;
		reloadIcon.scrollFactor.set();

		leaveIcon.x = _bg.width - (leaveIcon.width + 16);
		githubIcon.x = leaveIcon.x - githubIcon.width - 16;
		reloadIcon.x = githubIcon.x - reloadIcon.width - 16;

		add(reloadIcon);
		add(githubIcon);
		add(leaveIcon);
	}

	function onLeaveIconClicked(icon:ButtonSpriteNode)
	{
		switch (Constants.CURRENT_STATE)
		{
			case 'EditorState':
				Sys.exit(0);
			case 'PlayState':
				FlxG.switchState(() -> new EditorState());
		}
	}

	function onGithubIconClicked(icon:ButtonSpriteNode)
	{
		FlxG.openURL('https://github.com/bopel-maki-macohi/FlxEngine');
	}

	function onReloadIconClicked(icon:ButtonSpriteNode)
	{
		FlxG.switchState(() -> new PlayState(PlayState.project));
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
