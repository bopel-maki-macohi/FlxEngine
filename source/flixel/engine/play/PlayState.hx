package flixel.engine.play;

import flixel.engine.editor.EditorProject;
import flixel.engine.editor.EditorToolbar;
import flixel.engine.play.nodes.state.StateNode;
import flixel.math.FlxMath;

class PlayState extends StateNode
{
	var project:EditorProject;

	var toolbar:EditorToolbar;

	override public function new(project:EditorProject)
	{
		super();

		this.project = project;
	}

	override function create()
	{
		toolbar = new EditorToolbar(FlxG.width);

		super.create();

		add(toolbar);
		toolbar.y -= toolbar.height;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		toolbar.y = FlxMath.lerp(toolbar.y, ((FlxG.mouse.y < toolbar.height) ? 0 : -toolbar.height), 0.04);
	}
}
