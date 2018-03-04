#!/bin/bash

# Script Name: AtoMiC Kodi Updater
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)


source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

if DoesAppFolderExist; then
    sudo killall -9 kodi.bin >/dev/null 2>&1
    source "$SCRIPTPATH/kodi/kodi-repository-configurator.sh"
    source "$SCRIPTPATH/inc/app-repository-add.sh"
    source "$SCRIPTPATH/inc/pkgupdate.sh"
    source "$SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh"
    source "$SCRIPTPATH/kodi/kodi-constants.sh"
    source "$SCRIPTPATH/inc/app-install-deps.sh"
    source "$SCRIPTPATH/inc/app-update.sh"
    source "$SCRIPTPATH/inc/app-update-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
