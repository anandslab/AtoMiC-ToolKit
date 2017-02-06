#!/bin/bash
# Script Name: AtoMiC Transmission Installer
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
source $SCRIPTPATH/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN"AtoMiC $APPTITLE Installer Script"$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/transmission-daemon/transmission-daemon-repository-configurator.sh
source $SCRIPTPATH/inc/app-repository-add.sh
source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-move-previous.sh
source $SCRIPTPATH/inc/app-install-deps.sh
source $SCRIPTPATH/inc/app-install.sh
# source $SCRIPTPATH/inc/app-stop.sh

# sleep 2
# sudo service transmission-daemon stop > /dev/null 2>&1 
# sleep 2
# sudo killall transmission-daemon > /dev/null 2>&1 

source $SCRIPTPATH/inc/app-autostart-configure.sh
source $SCRIPTPATH/transmission-daemon/transmission-daemon-settings-configurator.sh
source $SCRIPTPATH/inc/app-set-permissions.sh

source $SCRIPTPATH/inc/app-start.sh
echo 'Waiting for Transmission to finish initial setup' 
sleep 5
echo 'Now stop and start the service again to allow network access' 
source $SCRIPTPATH/inc/app-stop.sh
sudo sed -i "s@\"rpc-whitelist-enabled\": true@\"rpc-whitelist-enabled\": false@g" $APPSETTINGS  || { echo -e $RED'Modifying '$ACCESSHOST' in '$APPSETTINGS' file failed.'$ENDCOLOR; exit 1; }

source $SCRIPTPATH/inc/app-start.sh
kill -s SIGHUP `pidof transmission-daemon` >/dev/null 2>&1
source $SCRIPTPATH/inc/app-install-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
