package flixel.engine.screens;

import flixel.group.FlxContainer.FlxTypedContainer;

class FlxEngineScreenState<T> extends FlxEngineState
{
	public var screens:FlxTypedContainer<FlxEngineScreen<T>>;

	public var currentScreen(default, set):String;

	function set_currentScreen(newScreen:String):String
	{
		for (screen in screens)
			screen.active = screen.visible = screen.id.toLowerCase() == newScreen.toLowerCase();

		#if debug
		FlxG.watch.addQuick('Current Screen', newScreen.toLowerCase());
		#end
		
		return newScreen.toLowerCase();
	}

	public function setCurrentScreen(newScreen:String):Void
	{
		currentScreen = newScreen;
	}

	override public function new()
	{
		super();

		screens = new FlxTypedContainer<FlxEngineScreen<T>>();
	}

	public function addScreen(screen:FlxEngineScreen<T>)
	{
		if (screen == null)
			return;

		if (screen.members.indexOf(screen) > 0)
			return;

		screens.add(screen);
	}

	public function removeScreen(screen:FlxEngineScreen<T>)
	{
		if (screen.members.indexOf(screen) < 0)
			return;

		screens.remove(screen);
	}

	override function create()
	{
		super.create();

		add(screens);

		for (screen in screens)
			screen.create();
	}

	override function destroy()
	{
		super.destroy();

		#if debug
		FlxG.watch.removeQuick('Current Screen');
		#end
	}
}
