#!/bin/bash
# Script Name: AtoMiC Aria2 Updater

source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/aria2/aria2-constants.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

if DoesAppFolderExist; then
    source "$SCRIPTPATH/aria2/aria2-download.sh"
    source "$SCRIPTPATH/inc/app-update-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
