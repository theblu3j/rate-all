#!/bin/sh

# rate-all
# mostly a utility for me, that i adjusted to be usable on a few other arch forks and usable with chaotic-aur because friends use endeavouros + chaotic-aur
# yes formatting is all over the place
# yes a lot of the code is ripped from google or the rate-mirrors github

# only arch repos can use --max-delay for some reason
# --completion makes it only select mirrors that are up to date, but it also only works for arch repos
# chmod 644 thing is for pkgstats timer, probably not a security risk i think

# WORLD OF COLOR
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




interactive=false
while getopts 'i' flag; do
  case "${flag}" in
    i)interactive=true ;;
    *)echo "use 'rate-all -i' to run interactively" ; exit ;;
  esac
done

center() {
  cols=$(($(tput cols) - 6))
  gum style --border double --align center --width "$cols" --margin "1 2" --padding "2 4" "$1"
}

rate_arch() {
  echo "${LIGHTCYAN}" ; center "RATING ARCH MIRRORS"; echo "${NOCOLOR}"
  export TMPFILE ; TMPFILE="$(mktemp)"
  rate-mirrors --save="$TMPFILE" arch --max-delay=5000 --completion=1 \
  && checkban "$TMPFILE" \
  && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak \
  && sudo mv "$TMPFILE" /etc/pacman.d/mirrorlist
  echo "${NOCOLOR}"
  chmod 644 /etc/pacman.d/mirrorlist
  sudo chown root:root /etc/pacman.d/mirrorlist
}
rate_endeavouros() {
  echo "${LIGHTPURPLE}" ; center "RATING ENDEAVOUROS MIRRORS" ; echo "${NOCOLOR}"
  export TMPFILE ; TMPFILE="$(mktemp)"
  rate-mirrors --save="$TMPFILE" endeavouros \
  && checkban "$TMPFILE" \
  && sudo mv /etc/pacman.d/endeavouros-mirrorlist /etc/pacman.d/endeavouros-mirrorlist.bak \
  && sudo mv "$TMPFILE" /etc/pacman.d/endeavouros-mirrorlist
  echo "${NOCOLOR}"
  chmod 644 /etc/pacman.d/endeavouros-mirrorlist
  sudo chown root:root /etc/pacman.d/endeavouros-mirrorlist
}
rate_chaotic() {
  echo "${RED}" ; center "RATING CHAOTIC-AUR MIRRORS" ; echo "${NOCOLOR}"
  export TMPFILE ; TMPFILE="$(mktemp)"
  sudo true
  rate-mirrors --save="$TMPFILE" chaotic-aur \
  && checkban "$TMPFILE" \
  && sudo mv /etc/pacman.d/chaotic-mirrorlist /etc/pacman.d/chaotic-mirrorlist.bak \
  && sudo mv "$TMPFILE" /etc/pacman.d/chaotic-mirrorlist
  echo "${NOCOLOR}"
  chmod 644 /etc/pacman.d/chaotic-mirrorlist
  sudo chown root:root /etc/pacman.d/chaotic-mirrorlist
}

rate_all() {
  if [ -e /etc/pacman.d/mirrorlist ]; then
    rate_arch
  fi


  if [ -e /etc/pacman.d/endeavouros-mirrorlist ]; then
    rate_endeavouros
  fi


  if [ -e /etc/pacman.d/chaotic-mirrorlist ]; then
    rate_chaotic
  fi
}

checkban() {
  grep -vE '^(\s*$|#)' /etc/rate-all/banned-mirrors.conf | while read -r line ; do
    sudo sed -i "/$line/ s?^?#?" "$1"
  done	
}

if [ $interactive = true ] ; then
  center "Would you like to rate mirrors? (y/N)"
  read -r input
else
  input='y'
fi

if [ "$input" = "y" ] || [ "$input" = "Y" ] || [ "$input" = "yes" ] ; then
  sudo true
  rate_all
else
  echo "Skipping rating mirrors"
fi
