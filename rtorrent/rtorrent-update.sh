#!/bin/bash

# Script Name: AtoMiC rTorrent Updater
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)


source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/rtorrent/rtorrent-constants.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"

if DoesAppFolderExist; then
    source "$SCRIPTPATH/inc/app-stop.sh"
    source "$SCRIPTPATH/inc/pkgupdate.sh"
    source "$SCRIPTPATH/inc/app-install-deps.sh"
    source "$SCRIPTPATH/inc/app-update.sh"
    source "$SCRIPTPATH/inc/app-start.sh"
    echo -e "${GREEN}---> rTorrent update complete.$ENDCOLOR"
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
fi
