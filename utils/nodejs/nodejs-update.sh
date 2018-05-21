#!/bin/bash
# Script Name: AtoMiC Node.js Updater

source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

if DoesAppFolderExist; then
    source "$SCRIPTPATH/inc/pkgupdate.sh"
    source "$SCRIPTPATH/inc/app-update.sh"
    sudo -u "$UNAME" npm update npm -g
    sudo -u "$UNAME" npm update -g
    source "$SCRIPTPATH/inc/app-update-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
