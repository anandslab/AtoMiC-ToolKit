#!/bin/bash
# Script Name: AtoMiC Unrar Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e $GREEN"AtoMiC Unrar Installer Script"$ENDCOLOR
source $SCRIPTPATH/inc/app-constant-reset.sh
source $SCRIPTPATH/utils/unrar/unrar-constants.sh
source $SCRIPTPATH/inc/app-install-deps.sh

cd $(mktemp -d)

URL=$(curl -s http://www.rarlab.com/rar_add.htm | grep -o '".*"' | grep 'unrarsrc' | sed 's/"//g') # | grep '(?<=href=")[^"]*') 
echo
echo -e $YELLOW"URL Found: ${URL}"$ENDCOLOR
VERSION=$(echo $URL | grep -oP '(?<=unrarsrc-).*(?=.tar)')
echo -e $YELLOW"Downloaded Version: 1:${VERSION}-1"$ENDCOLOR
CURRENTUNRAR=$(dpkg -s unrar | grep Version | cut -d " " -f2-)
echo -e $YELLOW"Installed Version:  $CURRENTUNRAR"$ENDCOLOR

if [[ ! $CURRENTUNRAR = "1:${VERSION}-1" ]] ; then
    echo
    sudo curl "${URL}" | tar -xz
    cd unrar
    echo
    sudo apt-get remove unrar -y
    echo 'Starting Build'
    sudo make
    sudo checkinstall -y --pkgversion="1:${VERSION}" --pakdir='/var/cache/apt/archives'

    rm -r $(pwd)
    cd $SCRIPTPATH
    source $SCRIPTPATH/inc/app-constant-reset.sh
    echo -e $GREEN"---> Unrar installation complete."$ENDCOLOR
else
    echo -e $GREEN"---> Unrar update not required."$ENDCOLOR
    echo
fi