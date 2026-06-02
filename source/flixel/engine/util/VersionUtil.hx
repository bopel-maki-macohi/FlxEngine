package flixel.engine.util;

import thx.semver.Version;
import thx.semver.VersionRule;

class VersionUtil
{
	public static function matches(version:Version, rule:VersionRule)
		return rule.isSatisfiedBy(version);
}
