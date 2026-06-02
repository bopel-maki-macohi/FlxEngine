package flixel.engine.util;

import thx.semver.VersionRule;
import thx.semver.Version;

class VersionUtil
{

    public static function matches(version:Version, rule:VersionRule)
        return rule.isSatisfiedBy(version);
    
}