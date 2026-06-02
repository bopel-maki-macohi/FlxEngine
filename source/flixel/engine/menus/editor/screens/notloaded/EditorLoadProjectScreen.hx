package flixel.engine.menus.editor.screens.notloaded;

import flixel.util.FlxColor;
import flixel.math.FlxMath;
import flixel.engine.graphics.InteractableLabelSprite;
import sys.FileSystem;

class EditorLoadProjectScreen extends EditorScreen
{
	override public function new(parent:EditorState)
	{
		super('editor.loadProject', parent);
	}

	public var projects:Array<String> = [];

	var ILSGroup:InteractableLabelSpriteGroup;

	var selected:Int = 0;

	var cam:FlxCamera;
	var camFollow:FlxObject;

	override function create()
	{
		super.create();

		cam = new FlxCamera();
		cam.bgColor.alpha = 0;
		FlxG.cameras.add(cam, false);

		ILSGroup = new InteractableLabelSpriteGroup();
		add(ILSGroup);
		ILSGroup.cameras = [cam];

		camFollow = new FlxObject(FlxG.width / 2, FlxG.height / 2);
		add(camFollow);

		cam.follow(camFollow, LOCKON, .04);

		changeSelect(0);
	}

	override function onOpen()
	{
		super.onOpen();

		selected = 0;
		changeSelect(0);
	}

	public function reloadProjects()
	{
		projects = [];

		for (project in FileSystem.readDirectory(AssetPaths.getProjectsPath('')))
		{
			if (FileSystem.exists(AssetPaths.getProjectPath(project, 'meta.json')))
				projects.push(project);
		}

		trace('Projects: $projects');

		ILSGroup.forEach(ILS ->
		{
			ILSGroup.remove(ILS);
			ILS.destroy();
		});
		ILSGroup.clear();

		for (i => project in projects)
		{
			var ILS = new InteractableLabelSprite(project, 'file', 16, 16, 4);
			ILSGroup.add(ILS);

			ILS.screenCenter(X);
			ILS.ID = i;
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			parent.setCurrentScreen(parent.screen_noProject.id);
			return;
		}

		if (FlxG.keys.justPressed.ENTER)
		{
			var project:String = null;

			ILSGroup.forEach(ILS ->
			{
				if (ILS.ID == selected)
					project = ILS.labelText;
			});

			if (project == null)
				parent.setCurrentScreen(parent.screen_noProject.id);
			else
			{
				if (parent.project.loadProject(project))
					parent.setCurrentScreen(parent.screen_project.id);
				else
					parent.setCurrentScreen(parent.screen_noProject.id);
			}

			return;
		}

		if (FlxG.keys.anyJustPressed([W, UP]))
			changeSelect(-1);
		if (FlxG.keys.anyJustPressed([S, DOWN]))
			changeSelect(1);

		ILSGroup.forEach(ILS ->
		{
			ILS.label.color = (selected == ILS.ID) ? FlxColor.YELLOW : FlxColor.WHITE;

			ILS.y = FlxMath.lerp(ILS.y, 96 * ILS.ID, .5);

			if (selected == ILS.ID)
				camFollow.y = ILS.y;
		});
	}

	function changeSelect(amount:Int)
	{
		selected += amount;

		if (selected < 0)
			selected = projects.length - 1;
		if (selected > projects.length - 1)
			selected = 0;
	}
}
