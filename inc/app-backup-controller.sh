#!/bin/bash

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e $GREEN"AtoMiC $APPTITLE Backup Script"$ENDCOLOR
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-folder-check.sh"
source "$SCRIPTPATH/inc/app-backup-list.sh"
source "$SCRIPTPATH/inc/app-backup.sh"
source "$SCRIPTPATH/inc/app-backup-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
