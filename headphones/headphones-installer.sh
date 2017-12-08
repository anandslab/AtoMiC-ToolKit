#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Headphones Installer
# Author: PREngineer
# Publisher: http://www.htpcbeginner.com

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-move-previous.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install-deps.sh"
source "$SCRIPTPATH/inc/app-git-download.sh"
source "$SCRIPTPATH/inc/app-autostart-configure.sh"
source "$SCRIPTPATH/inc/app-set-permissions.sh"
source "$SCRIPTPATH/inc/app-start.sh"
echo "Waiting for $APPTITLE to finish initial setup"
sleep 20
echo "Now stop to create the $APPSETTINGS file"
source "$SCRIPTPATH/inc/app-stop.sh"
echo
echo 'Set to Network Access'
sudo sed -i "s@${ACCESSHOST}localhost@${ACCESSHOST}0.0.0.0@g" $APPSETTINGS  || { echo -e $RED'Modifying '$ACCESSHOST' in '$APPSETTINGS' file failed.'$ENDCOLOR; exit 1; }

source "$SCRIPTPATH/inc/app-start.sh"

source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
