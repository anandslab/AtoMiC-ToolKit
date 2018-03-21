#!/bin/bash
# Script Name: AtoMiC Aria2 Updater

source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/aria2/aria2-constants.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"

if DoesAppFolderExist; then
    source "$SCRIPTPATH/inc/app-stop.sh"
    source "$SCRIPTPATH/aria2/aria2-download.sh"
    source "$SCRIPTPATH/inc/app-start.sh"
    echo -e "${GREEN}---> $APPTITLE update complete.$ENDCOLOR"
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
fi
