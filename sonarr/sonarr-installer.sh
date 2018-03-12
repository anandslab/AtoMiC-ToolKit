#!/bin/bash
# Script Name: AtoMiC Sonarr Installer

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"
source "$SCRIPTPATH/utils/mono/mono-installer.sh"
source "$SCRIPTPATH/sonarr/sonarr-constants.sh"
APPNAME='nzbdrone'
source "$SCRIPTPATH/inc/app-install.sh"
APPNAME='sonarr'
source "$SCRIPTPATH/inc/app-autostart-configure.sh"
source "$SCRIPTPATH/inc/app-start.sh"
echo "Waiting for $APPTITLE to finish initial setup"
sleep 5
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/inc/app-set-permissions.sh"
source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
