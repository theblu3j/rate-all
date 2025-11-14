## rate-all.sh
[rate-mirrors](https://github.com/westandskif/rate-mirrors) based script.
## What it does:
Rates mirrors for standard Arch, Chaotic-AUR, and EndeavourOS repos, while looking pretty

Auto detects which ones you actually are using

Interactive! (literally just yes or no)

Fun colors!

Automatically changes permissions to 644 for the mirrorlists so that the pkgstats service can submit (don't think this is a security risk as its read permission only, but if it is open an issue)

Designed to work well integrated into [Apdatifier](https://github.com/exequtic/apdatifier) because it doesn't support non Arch repos with it's mirrorlist generator, but works perfectly on its own, and could be used in other projects.

## What it doesn't do:
Rate mirrors from other Arch repos (I could add them if desired, but otherwise I just don't use others)

Rate mirrors automatically, because that puts unneeded strain on mirrors.

Will not please the robot overlords

## Requirements
bash, rate-mirrors
