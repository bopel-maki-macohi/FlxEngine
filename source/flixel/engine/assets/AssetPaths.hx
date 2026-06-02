package flixel.engine.assets;

class AssetPaths
{
	public static inline function png(path:String):String
		return '$path.png';

	public static inline function getPath(path:String):String
		return 'assets/$path';

	public static inline function getEditorPath(path:String):String
		return getPath('editor/$path');

	public static inline function getProjectsPath(path:String):String
		return getPath('projects/$path');
}
