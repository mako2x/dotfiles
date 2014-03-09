<?php
require_once("workflows.php");
$wf = new Workflows();

exec("find /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/*/System/Library/Frameworks -name '*.h' -and -not -path '*Simulator*' -exec grep -nH 10861 {} \;", $results);

foreach ( $results as $result ) {
	preg_match("/^(.*?:[0-9]+):(.*)/", $result, $matches);
	$wf->result("header-".md5($matches[1]), $matches[1], trim($matches[2]), '', null);
}

echo $wf->toxml();
?>