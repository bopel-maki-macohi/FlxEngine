package flixel.engine.play.nodes.state.screens;

import flixel.engine.play.nodes.event.EventSignalNode;
import flixel.engine.play.nodes.event.ui.ScreenChangeEventNode;
import flixel.group.FlxContainer.FlxTypedContainer;

class StateScreenNode<T> extends StateNode
{
	public var screens:FlxTypedContainer<ScreenNode<T>>;

	public var currentScreen(default, set):String;

	function set_currentScreen(newScreen:String):String
	{
		for (screen in screens)
		{
			screen.active = screen.visible = screen.id.toLowerCase() == newScreen.toLowerCase();

			if (screen.active)
				screen.onOpened();
			else
				screen.onClosed();
		}

		#if debug
		FlxG.watch.addQuick('Current Screen', newScreen.toLowerCase());
		#end

		onScreenChange.dispatch(new ScreenChangeEventNode({
			previousScreen: this.currentScreen,
			newScreen: newScreen.toLowerCase(),
		}));
		return newScreen.toLowerCase();
	}

	public var onScreenChange:EventSignalNode<ScreenChangeEventData> = new EventSignalNode<ScreenChangeEventData>();

	public function setCurrentScreen(newScreen:String):Void
	{
		currentScreen = newScreen;
	}

	override public function new()
	{
		super();

		screens = new FlxTypedContainer<ScreenNode<T>>();
	}

	public function addScreen(screen:ScreenNode<T>)
	{
		if (screen == null)
			return;

		if (screen.members.indexOf(screen) > 0)
			return;

		screen.onAdded();
		screens.add(screen);
	}

	public function removeScreen(screen:ScreenNode<T>)
	{
		if (screen.members.indexOf(screen) < 0)
			return;

		screen.onRemoved();
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

		for (screen in screens)
			screen.destroy();

		#if debug
		FlxG.watch.removeQuick('Current Screen');
		#end
	}
}
