#!/bin/bash
# Script Name: AtoMiC Unrar Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e $GREEN"AtoMiC Unrar Installer Script"$ENDCOLOR

CODENAME=$(lsb_release -c -s) 

case "$CODENAME" in
  'squeeze'|'wheezy'|'jessie'|'stretch'|'sid')
    sed -i "/non-free/s/^#//g" /etc/apt/sources.list

    source $SCRIPTPATH/inc/pkgupdate.sh
    sudo apt-get build-dep unrar-nonfree
    sudo apt-get source -b unrar-nonfree
    dpkg -i unrar_*_armhf.deb
    echo
    echo -e $GREEN'---> Unrar installation complete.'$ENDCOLOR
    ;;
  *)
    echo -e $RED'You can only usr this script on a Debian\Raspbian distro.'$ENDCOLOR
    ;;
esac


