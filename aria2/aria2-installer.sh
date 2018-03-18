#!/bin/bash
# Script Name: AtoMiC Aria2 Installer

source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/aria2/aria2-constants.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Install Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/aria2/aria2-download.sh"
source "$SCRIPTPATH/inc/app-update-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/inc/exit.sh"
