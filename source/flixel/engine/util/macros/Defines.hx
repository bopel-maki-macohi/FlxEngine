package flixel.engine.util.macros;

class Defines
{
	public static macro function isDefined(define:String)
	{
		return macro $v{haxe.macro.Context.defined(define)};
	}
}
