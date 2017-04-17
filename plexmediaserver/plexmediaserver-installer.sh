#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Plex Media Server Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh"
source "$SCRIPTPATH/plexmediaserver/plexmediaserver-constants.sh"
source "$SCRIPTPATH/inc/app-folders-create.sh"
#Copies over a service file that will get overridden unless one isnt created. (Dev2day repo currently doesnt)
source "$SCRIPTPATH/inc/app-install.sh"
source "$SCRIPTPATH/inc/app-autostart-configure.sh"
source "$SCRIPTPATH/inc/app-autostart-remove-unrequired-only.sh"
source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
echo 'Plex should start within a few seconds depending on the speed of your device.'
echo -e 'Open '$CYAN'http://localhost:32400/web'$ENDCOLOR' in your browser to continue the setup.'
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
