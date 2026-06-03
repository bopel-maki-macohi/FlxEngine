package flixel.engine.util;

import haxe.io.Path;
import flixel.engine.editor.*;
import flixel.engine.play.*;
import flixel.engine.play.nodes.button.*;
import flixel.engine.play.nodes.event.*;
import flixel.engine.play.nodes.event.ui.*;
import flixel.engine.play.nodes.script.*;
import flixel.engine.play.nodes.sprite.*;
import flixel.engine.play.nodes.state.*;
import flixel.engine.play.nodes.state.screens.*;
import flixel.engine.play.nodes.text.*;
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

	public static var SCRIPT_IMPORTS:Array<Dynamic> = [
		// Nodes
		ButtonIconSpriteNode,
		ButtonLabelSpriteGroupNode,
		ButtonLabelSpriteNode,
		ButtonNode,
		ButtonSpriteNode,
		ScreenChangeEventNode,
		EventNode,
		// EventSignalNode,
		ScriptGroupNode,
		ScriptNode,
		PopupSpriteNode,
		SpriteGroupNode,
		SpriteNode,
		ToolbarNode,
		StateNode,
		ScreenNode,
		StateScreenNode,
		InputLabelNode,
		InputTextNode,
		TextNode,
		//
		// Non-Nodes
		AssetPaths,
		Constants,
		FileUtil,
		VersionUtil,
		WindowUtil,
		EditorState,
		EditorToolbar,
		EditorScreen,
		EditorProject,
		PlayState,
	];

	public static var CURRENT_STATE(get, never):String;

	static function get_CURRENT_STATE():String
	{
		var state:String = Type.getClassName(Type.getClass(FlxG.state)).replace('.', '/');

		return Path.withoutDirectory(state);
	}
}
