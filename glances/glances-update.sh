#!/bin/bash
# Script Name: AtoMiC Glances Update

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
if DoesAppFolderExist; then
    source "$SCRIPTPATH/inc/app-stop.sh"
    source "$SCRIPTPATH/inc/app-autostart-remove.sh" #TODO Remove when users have had time to update
    source "$SCRIPTPATH/utils/python/python-installer.sh"
    source "$SCRIPTPATH/glances/glances-constants.sh"
    source "$SCRIPTPATH/inc/app-install-pips.sh"
    source "$SCRIPTPATH/inc/app-autostart-configure.sh" #TODO Remove when users have had time to update
    source "$SCRIPTPATH/inc/app-start.sh"
    source "$SCRIPTPATH/inc/app-install-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
    source "$SCRIPTPATH/inc/exit.sh"
fi
