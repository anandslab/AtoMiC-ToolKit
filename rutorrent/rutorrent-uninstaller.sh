#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC rutorrent Uninstaller
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Uninstaller Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/utils/nginx/nginx-constants.sh"
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/rutorrent/rutorrent-constants.sh"
source "$SCRIPTPATH/inc/app-file-del.sh"
source "$SCRIPTPATH/utils/nginx/nginx-constants.sh"
source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/rutorrent/rutorrent-constants.sh"
source "$SCRIPTPATH/inc/app-uninstall-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
