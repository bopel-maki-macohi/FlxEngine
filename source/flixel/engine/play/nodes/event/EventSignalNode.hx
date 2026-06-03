package flixel.engine.play.nodes.event;

import flixel.engine.play.nodes.event.EventNode;
import flixel.util.FlxSignal.FlxTypedSignal;

typedef EventSignalNode<T> = FlxTypedSignal<EventNode<T>->Void>;
