#!/bin/bash
# Script Name: AtoMiC Medusa Installer

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-move-previous.sh"
source "$SCRIPTPATH/utils/python/python-installer.sh"
source "$SCRIPTPATH/utils/unrar/unrar-installer.sh"
source "$SCRIPTPATH/medusa/medusa-constants.sh"
source "$SCRIPTPATH/inc/app-git-download.sh"
source "$SCRIPTPATH/inc/app-autostart-configure.sh"
source "$SCRIPTPATH/inc/app-set-permissions.sh"
source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
