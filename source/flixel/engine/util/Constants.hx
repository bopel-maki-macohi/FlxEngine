package flixel.engine.util;

import flixel.engine.util.macros.Git;

class Constants
{
	public static final GIT_COMMIT:String = Git.getGitCommit();

	public static var VERSION(get, never):String;

	static function get_VERSION():String
		return FlxG.stage?.application?.meta.get('version') ?? '0.0.0';

	public static var VERSION_FULL(get, never):String;

	static function get_VERSION_FULL():String
		return '$VERSION ($GIT_COMMIT)';
}
