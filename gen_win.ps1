# Copyright (c) 2018 Caffeine Inc.
# All rights reserved.

function Gen($arch, $config) {
    if ($config -eq "release") {
        $isDebug = "false"
    } else {
        $isDebug = "true"
    }
    gn gen "out\win_${arch}_${config}" --args="rtc_include_tests=false is_debug=$isDebug rtc_use_h264=true" --target_arch=$arch --target_cpu=$arch --ide=vs2017
    if (-Not $?) {
        throw "Failed to generate $arch\$config targets"
    }
}

$srcDir = "$PSScriptRoot\src"

Push-Location $srcDir -EA SilentlyContinue

try {
    if (-Not $?) {
        Write-Error "Couldn't cd into src directory. Make sure you run gclient sync first."
        exit 1
    }

    Gen x86 debug
    Gen x86 release
    Gen x64 debug
    Gen x64 release
} finally {
    Pop-Location
}
