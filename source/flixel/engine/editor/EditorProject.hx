package flixel.engine.editor;

import haxe.Json;
import json2object.JsonParser;
import json2object.JsonWriter;
import sys.io.File;
import thx.semver.Version;
import flixel.engine.play.nodes.script.ScriptNode;
import flixel.engine.util.Constants;
import flixel.engine.util.FileUtil;
import flixel.engine.util.VersionUtil;
import flixel.engine.util.WindowUtil;

using StringTools;

class EditorProject
{
	public static final API_VERSION_RULE:String = '>=0.1.0 <0.2.0';

	public var name:String;
	public var author:String;
	public var description:String;

	@:default('Main')
	@:optional
	public var main:String;

	@:default(flixel.engine.util.Constants.VERSION)
	public var api_version:String;

	public function new()
	{
		this.api_version = Constants.VERSION;
	}

	public function save():String
	{
		return new JsonWriter<EditorProject>().write(this, '\t');
	}

	public function loadProject(project:String)
	{
		var filteredName:String = project.toLowerCase();
		var path = AssetPaths.json(AssetPaths.getProjectPath(filteredName, 'meta'));

		if (!FileUtil.exists(path))
		{
			WindowUtil.alert('Project doesn\'t exist: $filteredName');
			return false;
		}

		if (loadData(File.getContent(path)))
		{
			trace('Loaded Project: $filteredName');
			updateProject(this);

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
				WindowUtil.alert('Project loading error: "$error"');

		var project = projectParser.fromJson(data);

		if (!VersionUtil.matches(project.api_version, API_VERSION_RULE))
		{
			WindowUtil.alert('Unmatching API Version "${project.api_version}" for project: "${project.name}"');
			return false;
		}

		var apiversion:Version = Version.stringToVersion(project.api_version);

		function defaultCase()
		{
			this.name = project.name;
			this.author = project.author;
			this.description = project.description;
			this.main = project?.main ?? 'Main';
		}

		switch (apiversion.major)
		{
			case 0:
				defaultCase();

			default:
				WindowUtil.alert('No loading case for major API Version: ${apiversion.major}, using default');
				defaultCase();
		}

		this.api_version = Version.stringToVersion(project.api_version).toString();

		return true;
	}

	public static function addProject(project:EditorProject)
	{
		var filteredName:String = project.name.toLowerCase();

		if (filteredName.trim().length < 0 || filteredName.trim() == '')
		{
			WindowUtil.alert('Missing Project Name');
			return;
		}

		var dir = AssetPaths.getProjectsPath(filteredName);

		if (FileUtil.exists(dir))
		{
			WindowUtil.alert('Project already exists: $filteredName');
			return;
		}

		FileUtil.createDirectory(dir);

		if (updateProject(project))
			trace('Added Project: $filteredName');
	}

	public static function updateProject(project:EditorProject)
	{
		var filteredName:String = project.name.toLowerCase();

		if (filteredName.trim().length < 0 || filteredName.trim() == '')
		{
			WindowUtil.alert('Missing Project Name');
			return false;
		}

		var dir = AssetPaths.getProjectsPath(filteredName);

		if (!FileUtil.exists(dir))
		{
			WindowUtil.alert('Project doesn\'t exist: $filteredName');

			return false;
		}

		File.saveContent(AssetPaths.json(AssetPaths.getProjectPath(filteredName, 'meta')), project.save());

		var scriptPath = AssetPaths.script(AssetPaths.getProjectPath(filteredName, project.main ?? 'Main'));

		if (!FileUtil.exists(scriptPath))
			File.saveContent(scriptPath,
				'// Generated via FlxEngine v${Constants.VERSION_FULL} @ ${Date.now()} for project: "${project.name}"\n' + ScriptNode.getDefaultScript());

		trace('Updated ${project.name}');
		return true;
	}

	public function toString()
	{
		return 'EditorProject($name by $author)';
	}
}
