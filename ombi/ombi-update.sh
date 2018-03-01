#!/bin/bash

# Script Name: AtoMiC Ombi Updater
# Author: mgiljum
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

if DoesAppFolderExist; then
    source "$SCRIPTPATH/inc/app-stop.sh"
    source "$SCRIPTPATH/utils/mono/mono-installer.sh"
    source "$SCRIPTPATH/ombi/ombi-constants.sh"
    source "$SCRIPTPATH/inc/app-install-deps.sh"
    source "$SCRIPTPATH/ombi/ombi-download.sh"
    source "$SCRIPTPATH/inc/app-set-permissions.sh"
    source "$SCRIPTPATH/inc/app-start.sh"
    source "$SCRIPTPATH/inc/app-update-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
