#!/bin/bash

#Force a full update, distro upgrade and autoclean

echo -e "${GREEN}AtoMiC Update Distro and Packages Script$ENDCOLOR"
echo
echo -e "$YELLOW--->UPDATING REPOPSITORIES ...$ENDCOLOR"
apt-get update

source "$SCRIPTPATH/inc/app-toolkit-deps.sh"

echo
echo -e "$YELLOW--->UPGRADING PACKAGES ...$ENDCOLOR"
apt-get -y dist-upgrade
echo
echo -e "$YELLOW--->REMOVING UNEEDED PACKAGE FILES ...$ENDCOLOR"
apt-get -y autoremove
echo
echo -e "$YELLOW--->CLEANING PACKAGE FILES ...$ENDCOLOR"
apt-get -y autoclean

source "$SCRIPTPATH/inc/exit.sh"
