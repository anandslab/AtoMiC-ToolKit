#!/bin/bash
# Script Name: AtoMiC Kodi Remove Launch on boot
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $ISSETUP != "Yes" ]]; then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi

echo -e $GREEN"AtoMiC $APPTITLE Remove Launch on boot Script"$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/app-stop.sh
source $SCRIPTPATH/inc/app-autostart-remove.sh
source $SCRIPTPATH/inc/pause.sh
