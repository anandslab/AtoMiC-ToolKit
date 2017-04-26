#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC rTorrent Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install-deps.sh"
source "$SCRIPTPATH/inc/app-install.sh"
source "$SCRIPTPATH/inc/app-folders-create.sh"
source "$SCRIPTPATH/inc/app-autostart-configure.sh"

echo 'Coping rtorrent.rc to home dir'
sudo cp "$SCRIPTPATH/rtorrent/rtorrent.rc" ~/.rtorrent.rc || \
        { echo -e "$RED Coping rtorrent.rc failed.$ENDCOLOR" ; exit 1; }

source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
