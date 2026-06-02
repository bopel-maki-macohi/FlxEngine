package flixel.engine.util;

class WindowUtil
{
	public static function alert(message:String)
	{
		FlxG.stage.application.window.alert(message, 'FlxEngine Alert');
	}
}
