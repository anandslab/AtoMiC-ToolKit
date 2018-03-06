#!/bin/bash

# Script Name: AtoMiC qBittorrent Uninstaller
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Uninstaller Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-uninstall.sh"
source "$SCRIPTPATH/inc/app-file-del.sh"

if [[ ! -d '/home/'$UNAME'/.config/deluge' ]]; then
    source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh"
    source "$SCRIPTPATH/inc/app-repository-remove.sh"
fi

source "$SCRIPTPATH/inc/app-uninstall-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
