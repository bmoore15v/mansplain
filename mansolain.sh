#!/bin/sh
# man to PDF Script
# by Barry Moore <barry@toworkandkeep.com>
# License: GNU GPLv3

### OPTIONS AND VARIABLES ###

while getopts ":a:b:p:h" o; do case "${o}" in
	h) printf "Optional arguments for custom use:\\n  -p: Dependencies and programs csv (local file or url)\\n  -a: AUR helper (must have pacman-like syntax)\\n  -h: Show this message\\n" && exit 1 ;;
	b) repobranch=${OPTARG} ;;
	p) progsfile=${OPTARG} ;;
	a) aurhelper=${OPTARG} ;;
	*) printf "Invalid option: -%s\\n" "$OPTARG" && exit 1 ;;
esac done

[ -z "$dotfilesrepo" ] && dotfilesrepo="https://github.com/lukesmithxyz/voidrice.git"
[ -z "$progsfile" ] && progsfile="https://raw.githubusercontent.com/LukeSmithxyz/LARBS/master/progs.csv"
[ -z "$aurhelper" ] && aurhelper="paru"
[ -z "$repobranch" ] && repobranch="master"

### FUNCTIONS ###

installpkg(){ pacman --noconfirm --needed -S "$1" >/dev/null 2>&1 ;}

error() { echo "ERROR: $1" ; exit 1;}
