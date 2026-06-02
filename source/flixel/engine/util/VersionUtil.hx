package flixel.engine.util;

import thx.semver.Version;
import thx.semver.VersionRule;

class VersionUtil
{
	#if hl
	public static function matches(version:String, rule:String)
		return true;
	#else
	public static function matches(version:Version, rule:VersionRule)
		return rule.isSatisfiedBy(version);
	#end
}
