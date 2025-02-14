#!/bin/bash

# rate-all.sh
# mostly a utility for me, that i adjusted to be usable on a few other arch forks and usable with chaotic-aur because friends use endeavouros + chaotic-aur
# yes formatting is all over the place
# yes a lot of the code is ripped from google or the rate-mirrors github

# only arch repos can use --max-delay for some reason
# --completion makes it only select mirrors that are up to date, but it also only works for arch repos
# chmod 744 thing is for pkgstats timer, probably not a security risk i think


center() {
  termwidth="$(tput cols)"
  padding="$(printf '%0.1s' -{1..500})"
  printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}

function rate-arch {
  printf ${LIGHTCYAN} ; center "RATING ARCH MIRRORS"; printf ${NOCOLOR} ; \
  export TMPFILE="$(mktemp)"; \
  sudo true; \
  rate-mirrors --save=$TMPFILE arch --max-delay=2500 --completion=1 \
  && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak \
  && sudo mv $TMPFILE /etc/pacman.d/mirrorlist ; \
  chmod 744 /etc/pacman.d/mirrorlist ; \
  printf ${NOCOLOR}
}
function rate-endeavouros {
  printf ${LIGHTPURPLE} ; center "RATING ENDEAVOUROS MIRRORS" ; printf ${NOCOLOR} ; \
  export TMPFILE="$(mktemp)"; \
  sudo true; \
  rate-mirrors --save=$TMPFILE endeavouros \
  && sudo mv /etc/pacman.d/endeavouros-mirrorlist /etc/pacman.d/endeavouros-mirrorlist.bak \
  && sudo mv $TMPFILE /etc/pacman.d/endeavouros-mirrorlist ; \
  chmod 744 /etc/pacman.d/endeavouros-mirrorlist ; \
  printf ${NOCOLOR}
}
function rate-chaotic {
  printf ${RED} ; center "RATING CHAOTIC-AUR MIRRORS" ; printf ${NOCOLOR} ; \
  export TMPFILE="$(mktemp)"; \
  sudo true; \
  rate-mirrors --save=$TMPFILE chaotic-aur \
  && sudo mv /etc/pacman.d/chaotic-mirrorlist /etc/pacman.d/chaotic-mirrorlist.bak \
  && sudo mv $TMPFILE /etc/pacman.d/chaotic-mirrorlist ; \
  chmod 744 /etc/pacman.d/chaotic-mirrorlist
}

function rate-all {
  if [ -e /etc/pacman.d/mirrorlist ]; then
    rate-arch
  fi


  if [ -e /etc/pacman.d/endeavouros-mirrorlist ]; then
    rate-endeavouros
  fi


  if [ -e /etc/pacman.d/chaotic-mirrorlist ]; then
    rate-chaotic
  fi
}

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

center "Would you like to rate mirrors? (y/N)"
read input
if [ "$input" = "y" ] || [ "$input" = "Y" ] || [ "$input" = "yes" ] ; then
rate-all
else
echo "Skipping rating mirrors"
fi



