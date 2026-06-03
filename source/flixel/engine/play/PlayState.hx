package flixel.engine.play;

import flixel.engine.editor.EditorProject;
import flixel.engine.editor.EditorToolbar;
import flixel.engine.play.nodes.script.ScriptGroupNode;
import flixel.engine.play.nodes.script.ScriptNode;
import flixel.engine.play.nodes.state.StateNode;
import flixel.math.FlxMath;

class PlayState extends StateNode
{
	var project:EditorProject;

	var toolbar:EditorToolbar;

	var scripts:ScriptGroupNode;

	override public function new(project:EditorProject)
	{
		super();

		this.project = project;
	}

	override function create()
	{
		toolbar = new EditorToolbar(FlxG.width);

		super.create();

		scripts = new ScriptGroupNode();
		scripts.add(new ScriptNode(AssetPaths.script(AssetPaths.getProjectPath(project.name, project?.main ?? 'Main'))));

		add(toolbar);
		toolbar.y -= toolbar.height;

		scripts.set('game', this);
		scripts.set('project', project);

		scripts.call('onCreate', []);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		toolbar.y = FlxMath.lerp(toolbar.y, ((FlxG.mouse.y < toolbar.height) ? 0 : -toolbar.height), 0.04);

		scripts.call('onUpdate', [elapsed]);
	}
}
