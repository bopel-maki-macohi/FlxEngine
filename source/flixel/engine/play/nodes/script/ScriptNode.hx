package flixel.engine.play.nodes.script;

import crowplexus.iris.Iris;
import sys.io.File;
import flixel.engine.util.FileUtil;

class ScriptNode extends Iris
{
	override public function new(filepath:String)
	{
		var fileContent:String = 'trace("$filepath doesn\'t exist");';

		if (FileUtil.exists(filepath))
		{
			fileContent = File.getContent(filepath);
            // trace(filepath);
		}

		super(fileContent, {
			name: filepath,
		});
	}

	override function preset()
	{
		super.preset();

		// init vars here
	}

	public static function getDefaultScript()
	{
		var lines:Array<String> = [];

		lines.push('function onAddedToGroup() {}');
		lines.push('function onRemovedFromGroup() {}');
		lines.push('');
		lines.push('function onCreate() {}');
		lines.push('function onUpdate(elapsed:Float) {}');
		lines.push('');

		return lines.join('\n');
	}
}
