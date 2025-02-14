## rate-all.sh
[rate-mirrors](https://github.com/westandskif/rate-mirrors) based script.
## What it does:
Rates mirrors for standard Arch, Chaotic-AUR, and EndeavourOS repos

Auto detects which ones you actually are using

Interactive! (literally just yes or no)

Fun colors!

Automatically changes permissions to 744 for the mirrorlists so that the pkgstats service can submit (don't think this is a security risk as its read permission only, but if it is open an issue)

Designed to work well integrated into [Apdatifier](https://github.com/exequtic/apdatifier) because it doesn't support non Arch repos with it's mirrorlist generator, but would probably work perfectly elsewhere
## Requirements
bash, rate-mirrors
