#!/bin/bash
# Script Name: AtoMiC Aria2 Installer

source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/aria2/aria2-constants.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Install Script$ENDCOLOR"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-folders-create.sh"
source "$SCRIPTPATH/aria2/aria2-system-configure.sh"
source "$SCRIPTPATH/inc/app-set-permissions.sh"
source "$SCRIPTPATH/aria2/aria2-download.sh"
source "$SCRIPTPATH/inc/app-autostart-configure.sh"
source "$SCRIPTPATH/inc/app-start.sh"
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
