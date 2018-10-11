# caffeine-rtc

A simplified wrapper for Caffeine's WebRTC implementation

## Building

### Prerequisite for all platforms:

* [Google's depot tools](https://webrtc.org/native-code/development/prerequisite-sw/)

Add the depot\_tools directory to the beginning of your path environment
variable.

### Windows

#### Prerequisites:

* [Visual Studio 2017](https://visualstudio.microsoft.com/vs/)

#### Build:

At a powershell prompt in the root directory of caffeine-rtc:

Before building the first time:

* `> gclient sync` - This can take a long time, even on fast connections. About
  **7-10 GB** of dependencies and tools will be downloaded from Google.
* `> .\gen_win.ps1` - th


If this is the first time building, run `> .\gclient sync` from the root
caffeine-rtc directory.

* `> gen_win.ps1`
* `> build_win.ps1`

The output files will be in `src\win_<arch>_<config>` where `<arch>` is either
`x86` or `x64`, and `<config>` is either `debug` or `release`. Inside that
directory will be (among other files):

* `caffeine-rtc.dll` - the main caffeine-rtc library
* `caffeine-rtc.dll.pdb` - debugging symbols for the DLL
* `caffeine-rtc.dll.lib` - the link library referencing the DLL

**TODO:** organize the build outputs & caffeine header into include/lib/bin
directories for easier consumption.

### Mac/Linux

#### TODO

## Troubleshooting

- gclient sync failure on mac/linux? https://github.com/dart-lang/sdk/issues/32702
- Enable long filename support for windows
