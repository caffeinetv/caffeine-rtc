# Copyright (c) 2018 Caffeine Inc.
# All rights reserved.

function Build($arch, $config) {
    ninja -C "out\win_${arch}_${config}" caffeine-rtc
    if (-Not $?) {
        throw "Failed to build $arch\$config target."
    }
}

$srcDir = "$PSScriptRoot\src"

Push-Location $srcDir -EA SilentlyContinue

try {
    if (-Not $?) {
        Write-Error "Couldn't cd into src directory. Make sure you run gclient sync first."
        exit 1
    }

    Build x64 debug
    Build x64 release
    Build x86 debug
    Build x86 release
} finally {
    Pop-Location
}
