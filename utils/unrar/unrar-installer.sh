#!/bin/bash
# Script Name: AtoMiC nzbToMedia Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e $GREEN"AtoMiC unrar Installer Script"$ENDCOLOR
sed -i '/http://archive.raspbian.org/raspbian/ jessie main contrib non-free rpi/s/^#//g' /etc/apt/sources.list

source $SCRIPTPATH/inc/pkgupdate.sh
sudo apt-get build-dep unrar-nonfree
sudo apt-get source -b unrar-nonfree
dpkg -i unrar_*_armhf.deb
echo
echo -e $GREEN"---> unrar installation complete."$ENDCOLOR
