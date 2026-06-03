package flixel.engine;

import flixel.engine.menus.editor.EditorState;
import flixel.engine.util.FileUtil;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		FileUtil.createDirectryIfNotExists(AssetPaths.getProjectsPath(''));

		// #if NOTIFICATION_TEST
		// FlxG.switchState(() -> new flixel.engine.menus.debug.NotificationTest());
		// #else
		FlxG.switchState(() -> new EditorState());
		// #end
	}
}
