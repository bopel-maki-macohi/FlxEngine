package flixel.system;

/**
 * Helper object for semantic versioning.
 * @see   http://semver.org/
 */
class FlxVersion
{
    public static final sha:String = '';

	public var major(default, null):Int;
	public var minor(default, null):Int;
	public var patch(default, null):Int;

	public function new(Major:Int, Minor:Int, Patch:Int)
	{
		major = Major;
		minor = Minor;
		patch = Patch;
	}

	/**
	 * Formats the version in the format "HaxeFlixel MAJOR.MINOR.PATCH",
	 * e.g. HaxeFlixel 3.0.4.
	 */
	public function toString():String
	{
		return 'HaxeFlixel $major.$minor.$patch';
	}
}
