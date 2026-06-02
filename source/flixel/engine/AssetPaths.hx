package flixel.engine;

class AssetPaths
{
	public static inline function png(path:String):String
		return '$path.png';

	public static inline function json(path:String):String
		return '$path.json';

	public static inline function json5(path:String):String
		return '${json(path)}5'; // im weird

	public static inline function getPath(path:String):String
		return 'assets/$path';

	public static inline function getEditorPath(path:String):String
		return getPath('editor/$path');

	public static inline function getProjectsPath(path:String):String
		return getPath('projects/$path');

	public static inline function getProjectPath(project:String, path:String):String
		return getProjectsPath('$project/$path');
}
