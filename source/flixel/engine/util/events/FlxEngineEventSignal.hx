package flixel.engine.util.events;

import flixel.engine.util.events.FlxEngineEvent;
import flixel.util.FlxSignal.FlxTypedSignal;

typedef FlxEngineEventSignal<T> = FlxTypedSignal<FlxEngineEvent<T>->Void>
