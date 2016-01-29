#!/bin/bash
# Script Name: AtoMiC Sick Beard Installer
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

source $SCRIPTPATH/sickbeard/sickbeard-constants.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-install-deps.sh
source $SCRIPTPATH/inc/app-move-previous.sh
source $SCRIPTPATH/inc/app-git-download.sh

echo
sleep 1

echo -e $YELLOW'--->Creating Run Directories and Files...'$ENDCOLOR
sudo mkdir /var/run/sickbeard >/dev/null 2>&1
sudo chown $UNAME:$UGROUP /var/run/sickbeard >/dev/null 2>&1
cp -a $APPPATH/autoProcessTV/autoProcessTV.cfg.sample $APPPATH/autoProcessTV/autoProcessTV.cfg || { echo -e $RED'Could not copy autoProcess.cfg.'$ENDCOLOR ; exit 1; }

source $SCRIPTPATH/inc/app-create-default.sh

sudo cp $APPPATH/init.ubuntu /etc/init.d/sickbeard || { echo -e $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
source $SCRIPTPATH/inc/app-init-add.sh

source $SCRIPTPATH/inc/app-git-stash.sh
source $SCRIPTPATH/inc/app-set-permissions.sh
source $SCRIPTPATH/inc/app-start.sh
source $SCRIPTPATH/inc/app-install-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
