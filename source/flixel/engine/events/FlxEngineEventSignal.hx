package flixel.engine.events;

import flixel.engine.events.FlxEngineEvent;
import flixel.util.FlxSignal.FlxTypedSignal;

typedef FlxEngineEventSignal<T> = FlxTypedSignal<FlxEngineEvent<T>->Void>
