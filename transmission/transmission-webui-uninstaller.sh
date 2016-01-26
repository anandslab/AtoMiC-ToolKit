#!/bin/bash
# Script Name: AtoMiC Transmission Uninstaller
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

APPNAME='transmission-daemon'
APPPATH='/home/'$UNAME'/.config/transmission'
APPTITLE='Transmission'

echo -e $GREEN'AtoMiC '$APPTITLE' Uninstaller Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/app-stop.sh

sudo killall transmission-daemon >/dev/null 2>&1
echo
sleep 1
echo -e $YELLOW'--->Uninstalling '$APPTITLE'...'$ENDCOLOR
sudo apt-get -y remove transmission-cli transmission-common transmission-daemon

source $SCRIPTPATH/inc/app-init-remove.sh
source $SCRIPTPATH/inc/app-file-del.sh

APPPATH='/home/'$UNAME'/Downloads/transmission'
source $SCRIPTPATH/inc/app-file-del.sh

source $SCRIPTPATH/inc/app-uninstall-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
