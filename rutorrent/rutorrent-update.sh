#!/bin/bash

# Script Name: AtoMiC rutorrent Updater
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

if DoesAppFolderExist; then
    source "$SCRIPTPATH/utils/nginx/nginx-update.sh"
    source "$SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh"
    source "$SCRIPTPATH/utils/unrar/unrar-installer.sh"
    source "$SCRIPTPATH/rtorrent/rtorrent-update.sh"
    source "$SCRIPTPATH/rutorrent/rutorrent-constants.sh"
    source "$SCRIPTPATH/inc/app-git-update.sh"
    source "$SCRIPTPATH/utils/nginx/nginx-enable-location.sh" 'SKIP'
    source "$SCRIPTPATH/inc/app-update-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
