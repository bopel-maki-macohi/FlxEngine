package flixel.engine.menus.editor;

import flixel.engine.util.VersionUtil;
import haxe.Json;
import sys.io.File;
import sys.FileSystem;
import thx.semver.Version;
import flixel.engine.util.Constants;
import json2object.JsonParser;
import json2object.JsonWriter;
import thx.semver.VersionRule;

class EditorProject
{
	public static final API_VERSION_RULE:String = '>=0.1.0 <0.2.0';

	public var name:String;
	public var author:String;
	public var description:String;

	@:default('0.1.0')
	public var api_version:String;

	@:jignored
	public var loaded:Bool = false;

	public function new()
	{
		this.api_version = Version.stringToVersion(Constants.VERSION).toString();
	}

	public function save():String
	{
		return new JsonWriter<EditorProject>().write(this, '\t');
	}

	public function loadProject(project:String)
	{
		var filteredName:String = project.toLowerCase();
		var path = AssetPaths.json(AssetPaths.getProjectPath(filteredName, 'meta'));

		if (!FileSystem.exists(path))
		{
			trace('PROJECT DOESN\'T EXIST: $filteredName');
			return false;
		}

		if (loadData(File.getContent(path)))
		{
			trace('Loaded Project: $filteredName');
			return true;
		}
		else
		{
			trace('Couldn\'t Load Project: $filteredName');
			return false;
		}
	}

	public function loadData(data:String)
	{
		var projectParser = new JsonParser<EditorProject>();

		if (projectParser.errors?.length > 0)
			for (error in projectParser.errors)
				trace(error);

		var project = projectParser.fromJson(data);

		if (!VersionUtil.matches(project.api_version, API_VERSION_RULE))
			return false;

		var apiversion:Version = Version.stringToVersion(project.api_version);

		function defaultCase()
		{
			this.name = project.name;
			this.author = project.author;
			this.description = project.description;
		}

		switch (apiversion.major)
		{
			case 0:
				defaultCase();

			default:
				trace('No case for major API Version: ${apiversion.major}');
				defaultCase();
		}

		this.api_version = Version.stringToVersion(project.api_version).toString();

		return loaded = true;
	}

	public static function addProject(project:EditorProject)
	{
		var filteredName:String = project.name.toLowerCase();
		var dir = AssetPaths.getProjectsPath(filteredName);

		if (FileSystem.exists(dir))
		{
			trace('PROJECT ALREADY EXISTS: $filteredName');
			return;
		}

		if (!FileSystem.exists(dir))
			FileSystem.createDirectory(dir);

		trace('Added Project: $filteredName');
		File.saveContent(AssetPaths.json(AssetPaths.getProjectPath(filteredName, 'meta')), project.save());
	}
}
