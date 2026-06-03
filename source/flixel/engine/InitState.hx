package flixel.engine;

import sys.FileSystem;
import flixel.engine.menus.editor.EditorState;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		if (!FileSystem.exists(AssetPaths.getProjectsPath('')))
			FileSystem.createDirectory(AssetPaths.getProjectsPath(''));

		#if NOTIFICATION_TEST
		FlxG.switchState(() -> new flixel.engine.menus.debug.NotificationTest());
		#else
		FlxG.switchState(() -> new EditorState());
		#end
	}
}
