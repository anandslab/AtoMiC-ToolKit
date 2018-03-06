#!/bin/bash
# Script Name: AtoMiC SABnzbd+ Updater
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

if DoesAppFolderExist; then
    source "$SCRIPTPATH/inc/app-stop.sh"
    source "$SCRIPTPATH/utils/python/python-installer.sh"
    source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-update.sh"
    source "$SCRIPTPATH/sabnzbdplus/sabnzbdplus-constants.sh"
    source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh"
    source "$SCRIPTPATH/inc/app-install-pips.sh"
    source "$SCRIPTPATH/inc/app-update.sh"
    source "$SCRIPTPATH/inc/app-start.sh"
    source "$SCRIPTPATH/inc/app-update-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
