#!/bin/bash
# Script Name: AtoMiC Headphones Installer
# Author: PREngineer
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $ISSETUP != "Yes" ]]; then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi

source $SCRIPTPATH/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN"AtoMiC $APPTITLE Installer Script"$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-install-deps.sh
source $SCRIPTPATH/inc/app-move-previous.sh
source $SCRIPTPATH/inc/app-git-download.sh
source $SCRIPTPATH/inc/app-autostart-configure.sh
source $SCRIPTPATH/inc/app-git-stash.sh
source $SCRIPTPATH/inc/app-set-permissions.sh
source $SCRIPTPATH/inc/app-start.sh
echo "Waiting for $APPTITLE to finish initial setup"
sleep 20 
echo "Now stop to create the $APPSETTINGS file"
source $SCRIPTPATH/inc/app-stop.sh 
echo
echo 'Set to Network Access'
sudo sed -i "s@${ACCESSPORT}localhost@${ACCESSPORT}0.0.0.0@g" $APPSETTINGS  || { echo -e $RED'Modifying '$ACCESSPORT' in '$APPSETTINGS' file failed.'$ENDCOLOR; exit 1; }

source $SCRIPTPATH/inc/app-start.sh 

source $SCRIPTPATH/inc/app-install-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
