package flixel.engine.util;

import thx.semver.Version;
import thx.semver.VersionRule;

class VersionUtil
{
	public static function matches(version:Version, rule:VersionRule)
	{
		#if hl return true; #end

		return rule.isSatisfiedBy(version);
	}
}
