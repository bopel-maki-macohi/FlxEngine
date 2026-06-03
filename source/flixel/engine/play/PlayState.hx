package flixel.engine.play;

import flixel.engine.editor.EditorProject;
import flixel.engine.editor.EditorToolbar;
import flixel.engine.play.nodes.script.ScriptGroupNode;
import flixel.engine.play.nodes.script.ScriptNode;
import flixel.engine.play.nodes.state.StateNode;
import flixel.engine.util.Constants;
import flixel.math.FlxMath;

class PlayState extends StateNode
{
	public static var project:EditorProject;

	override function destroy()
	{
		super.destroy();

		for (node in scripts.nodes)
		{
			scripts.nodes.remove(node);
			node.destroy();
		}
	}

	var toolbar:EditorToolbar;

	var scripts:ScriptGroupNode;

	override public function new(project:EditorProject)
	{
		super();

		PlayState.project = project;
	}

	override function create()
	{
		toolbar = new EditorToolbar(FlxG.width);

		super.create();

		scripts = new ScriptGroupNode();

		scripts.set('game', this);
		scripts.set('project', project);

		scripts.add(new ScriptNode(AssetPaths.script(AssetPaths.getProjectPath(project?.name, project?.main ?? 'Main'))));

		add(toolbar);
		toolbar.y -= toolbar.height;

		scripts.call('onCreate', []);
	}

	override function update(elapsed:Float)
	{
		members.sort((a, b) ->
		{
			return (a == toolbar) ? 1 : -1;
		});

		super.update(elapsed);

		toolbar.y = FlxMath.lerp(toolbar.y, ((FlxG.mouse.y < toolbar.height) ? 0 : -toolbar.height), 0.04);

		scripts.call('onUpdate', [elapsed]);
	}
}
