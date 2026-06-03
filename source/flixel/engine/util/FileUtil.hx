package flixel.engine.util;

import haxe.io.Path;
import sys.FileSystem;

using StringTools;

class FileUtil
{
	public static inline function readDirectory(directory:String)
	{
		if (directory == null || directory.trim().length < 1)
			return [];

		return FileSystem.readDirectory(Path.directory(directory));
	}

	public static inline function createDirectryIfNotExists(directory:String)
	{
		if (!directoryExists(directory))
			createDirectry(directory);
	}

	public static inline function createDirectry(directory:String)
	{
		if (directory == null || directory.trim().length < 1)
			return;

		FileSystem.createDirectory(Path.directory(directory));
	}

	public static inline function directoryExists(directory:String)
	{
		return fileExists(Path.directory(directory));
	}

	public static inline function fileExists(file:String)
	{
		if (file == null || file.trim().length < 1)
			return false;
		else
			return FileSystem.exists(file);
	}

	// yoinked from FNF V-Slice
	public static function openFolder(pathFolder:String, createIfNotExists:Bool = true):Void
	{
		pathFolder = pathFolder.trim().replace('\\', '/');
		if (!directoryExists(pathFolder))
		{
			if (createIfNotExists)
				createDirectry(pathFolder);
			else
			{
				trace('Path is not a directory: "$pathFolder"');
				return;
			}
		}

		#if windows
		Sys.command('explorer', [pathFolder.replace('/', '\\')]);
		#elseif mac
		Sys.command('open', [pathFolder]);
		#elseif linux
		var exitCode = Sys.command("xdg-open", [pathFolder]);
		if (exitCode == 0)
			return;
		var fileManagers:Array<String> = [
			"dolphin",
			"nautilus",
			"nemo",
			"thunar",
			"caja",
			"konqueror",
			"spacefm",
			"pcmanfm"
		];

		for (fm in fileManagers)
		{
			if (Sys.command("which", [fm]) == 0)
			{
				exitCode = Sys.command(fm, [pathFolder]);
				if (exitCode == 0)
					return;
			}
		}

		trace('No compatible file manager found for Linux.');
		#else
		WindowUtil.alert('External folder open is not supported on this platform.');
		#end
	}
}
