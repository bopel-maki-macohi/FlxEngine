package flixel.engine.events;

import flixel.engine.events.FlxEngineEvent;
import flixel.util.FlxSignal.FlxTypedSignal;

typedef FlxEngineEventSignal<T:FlxEngineEvent> = FlxTypedSignal<FlxEngineEvent<T>->Void>
