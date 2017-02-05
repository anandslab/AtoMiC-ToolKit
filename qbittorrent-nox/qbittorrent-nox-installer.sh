#!/bin/bash
# Script Name: AtoMiC qBittorrent Installer
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
echo
echo -e $YELLOW'By proceeding you are acceping qBittorrent Legal Notice...'$ENDCOLOR
source $SCRIPTPATH/inc/pause.sh

echo
sleep 1

source $SCRIPTPATH/qbittorrent-nox/qbittorrent-nox-repository-configurator.sh
source $SCRIPTPATH/inc/app-repository-add.sh
source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-move-previous.sh
source $SCRIPTPATH/inc/app-install.sh

echo
sleep 1
source $SCRIPTPATH/inc/app-autostart-configure.sh

echo 
sleep 1

source $SCRIPTPATH/inc/app-folders-create.sh
if [ ! -f "$APPSETTINGS" ]; then
	sudo cp $SCRIPTPATH/qbittorrent-nox/qBittorrent.conf $APPSETTINGS || { echo -e $RED'Conf file not copied.'$ENDCOLOR ; exit 1; }
fi

source $SCRIPTPATH/inc/app-set-permissions.sh
source $SCRIPTPATH/inc/app-start.sh
source $SCRIPTPATH/inc/app-install-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
