#!/bin/bash
# Script Name: AtoMiC Ombi Updater

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

if DoesAppFolderExist; then
    if source "$SCRIPTPATH/ombi/ombi-version-check.sh"; then
        source "$SCRIPTPATH/inc/app-stop.sh"
        source "$SCRIPTPATH/inc/app-install-deps.sh"
        source "$SCRIPTPATH/ombi/ombi-download.sh"
        source "$SCRIPTPATH/inc/app-set-permissions.sh"
        source "$SCRIPTPATH/inc/app-start.sh"
        source "$SCRIPTPATH/inc/app-update-confirmation.sh"
        source "$SCRIPTPATH/inc/thankyou.sh"
    fi
fi

source "$SCRIPTPATH/inc/exit.sh"
