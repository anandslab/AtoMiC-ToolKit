#!/bin/bash
# Script Name: AtoMiC APP Restore

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Restore Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

if DoesAppFolderExist; then
    source "$SCRIPTPATH/inc/app-backup-list.sh"
    source "$SCRIPTPATH/inc/app-restore.sh"
    source "$SCRIPTPATH/inc/app-restore-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
