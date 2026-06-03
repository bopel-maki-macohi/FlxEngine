package flixel.engine.util;

import haxe.io.Path;
import flixel.engine.util.macros.Git;

using StringTools;

class Constants
{
	public static final GIT_COMMIT:String = Git.getGitCommit();

	public static var VERSION(get, never):String;

	static function get_VERSION():String
		return FlxG.stage?.application?.meta.get('version') ?? '0.0.0';

	public static var VERSION_FULL(get, never):String;

	static function get_VERSION_FULL():String
		return '$VERSION ($GIT_COMMIT)';

	public static final DEFAULT_SPRITE_SCALE:Float = 2;

	public static var SCRIPT_IMPORTS:Array<Dynamic> = [];

	public static var CURRENT_STATE(get, never):String;

	static function get_CURRENT_STATE():String
	{
		var state:String = Type.getClassName(Type.getClass(FlxG.state)).replace('.', '/');

		return Path.withoutDirectory(state);
	}

	public static function convertToScriptVariable(cls:Dynamic)
	{
		var variable:Dynamic = {};

		for (field in Reflect.fields(cls))
			Reflect.setField(variable, field, Reflect.field(cls, field));

		return variable;
	}
}
