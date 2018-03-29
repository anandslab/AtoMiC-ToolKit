#!/bin/bash
# Script Name: AtoMiC FileBot Update

source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
if DoesAppFolderExist; then
    source "$SCRIPTPATH/inc/app-stop.sh"
    source "$SCRIPTPATH/inc/app-install-deps.sh"
    echo
    echo -e "$YELLOW--->Updating snap $APPTITLE package...$ENDCOLOR"
    snap refresh "$APPNAME"
    source "$SCRIPTPATH/inc/app-update-confirmation.sh"
    source "$SCRIPTPATH/utils/filebot/filebot-patron.sh"
fi
