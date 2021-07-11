# Package

version       = "0.1.0"
author        = "momeemt"
description   = "Neat Image Controller Architecture"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["Nica"]
skipDirs = @["Nicapkg"]

# Dependencies

requires "nim >= 1.4.8"
requires "ffmpeg >= 0.3.16"