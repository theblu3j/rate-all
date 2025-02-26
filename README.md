## rate-all.sh
[rate-mirrors](https://github.com/westandskif/rate-mirrors) based script.
## What it does:
Rates mirrors for standard Arch, Chaotic-AUR, and EndeavourOS repos

Auto detects which ones you actually are using

Interactive! (literally just yes or no)

Fun colors!

Automatically changes permissions to 744 for the mirrorlists so that the pkgstats service can submit (don't think this is a security risk as its read permission only, but if it is open an issue)

Designed to work well integrated into [Apdatifier](https://github.com/exequtic/apdatifier) (if you're using a version with [this]([url](https://github.com/exequtic/apdatifier/commit/79e557da03715130473887259ed3db316515fc81)) commit you can set it up to run BEFORE you actually upgrade) because it doesn't support non Arch repos with it's mirrorlist generator, but would probably work perfectly elsewhere

Defaults to not automatically rating mirrors when ran so that you don't spam mirror servers whenever you integrate this into something

## What it doesn't do:
Rate mirrors from other Arch repos (I could add them if desired, but otherwise I just don't use others)

Will not please the robot overlords

## Requirements
bash, rate-mirrors

## Future Plans
Use [gum](https://github.com/charmbracelet/gum) to make it look nicer? Already used in Arch's devtools package.
