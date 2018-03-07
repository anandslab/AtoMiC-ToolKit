#!/bin/bash
# Script Name: AtoMiC Grafana Updater

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

if DoesAppFolderExist; then
    source "$SCRIPTPATH/inc/pkgupdate.sh"
    source "$SCRIPTPATH/inc/app-stop.sh"
    source "$SCRIPTPATH/inc/app-update.sh"
    source "$SCRIPTPATH/inc/app-autostart-remove-unrequired-only.sh"
    source "$SCRIPTPATH/inc/app-start.sh"
    source "$SCRIPTPATH/inc/app-update-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
