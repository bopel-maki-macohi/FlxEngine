package flixel.engine.play.nodes.script;

import crowplexus.iris.Iris;
import haxe.io.Path;
import sys.io.File;
import flixel.engine.util.Constants;
import flixel.engine.util.FileUtil;

using StringTools;

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

		var classVars:Array<Dynamic> = [];

		for (value in Constants.SCRIPT_IMPORTS)
			classVars.push(value);

		for (cls in classVars)
		{
			try
			{
				var clsStr = '$cls';
				var clsName = clsStr.substr(clsStr.indexOf('$') + 1);

				set(Path.withoutDirectory(clsName), cls, false);
			}
			catch (e)
			{
				trace('$cls : $e');
			}
		}
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

	public function toString()
	{
		return 'ScriptNode(${config.name})';
	}
}
