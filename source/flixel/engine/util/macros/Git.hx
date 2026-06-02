package flixel.engine.util.macros;

import haxe.macro.Context;
import sys.io.Process;

class Git
{
	public static macro function getGitCommit()
	{
		var commit:String = '';

		var process = new Process('git rev-parse HEAD');

		if (process.exitCode() == 0)
			commit = process.stdout.readAll().toString().substr(0, 7);
		else
			Context.warning('Error attempting to get Git Commit: ${process.stderr.readAll().toString()}', Context.currentPos());

		process.close();

		return macro $v{commit};
	}
}
