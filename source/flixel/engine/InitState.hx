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

		FlxG.switchState(() -> new EditorState());
	}
}
