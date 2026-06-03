package flixel.engine;

import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.engine.editor.EditorState;
import flixel.engine.util.FileUtil;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		FileUtil.createDirectryIfNotExists(AssetPaths.getProjectsPath(''));

		FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, FlxPoint.weak(0, -1));
		FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 1, FlxPoint.weak(0, 1));

		FlxG.switchState(() -> new EditorState());
	}
}
