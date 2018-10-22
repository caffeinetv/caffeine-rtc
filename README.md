# caffeine-rtc

A simplified wrapper for Caffeine's WebRTC implementation

This is highly experimental and work-in-progress. The caffeine module that is currently inside the webrtc source will eventually be moved out and have webrtc as a dependency. For now this repo is just a helper for bootstrapping the gclient stuff and simplifying the build process

## Building

### Prerequisite for all platforms:

* [Google's depot tools](https://webrtc.org/native-code/development/prerequisite-sw/)

Add the depot\_tools directory to the path environment variable (beginning of path on windows, end of path on linux/mac).

Before building the first time, in the caffeine-rtc directory:

* `$ gclient sync` - This can take a long time, even on fast connections. About **7-10 GB** of dependencies and tools will be downloaded from Google.

### Windows

#### Prerequisites:

* [Visual Studio 2017](https://visualstudio.microsoft.com/vs/)
* Enable long filename support for Git: `git config --global core.longpaths true`

#### Build:

Open a powershell prompt and change to the caffeine-rtc directory

Before building the first time:

* `> .\gen_win.ps1` - this creates the various configuration directories

Then:

* `> build_win.ps1` - this actually builds the library

The output files will be in `src\win_<arch>_<config>` where `<arch>` is either `x86` or `x64`, and `<config>` is either `debug` or `release`. Inside that directory will be (among other files):

* `caffeine-rtc.dll` - the main caffeine-rtc library
* `caffeine-rtc.dll.pdb` - debugging symbols for the DLL
* `caffeine-rtc.dll.lib` - the link library referencing the DLL

**TODO:** organize the build outputs & caffeine header into include/lib/bin directories for easier third-party consumption.

### Mac/Linux

TODO: scripts

## Troubleshooting

- gclient sync failure on mac/linux? https://github.com/dart-lang/sdk/issues/32702
