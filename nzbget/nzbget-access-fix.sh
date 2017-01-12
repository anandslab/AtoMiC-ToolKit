#!/bin/bash
# Script Name: AtoMiC NZBGet Access change
# Author: TommyE123
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

source $SCRIPTPATH/nzbget/nzbget-constants.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Access Fix'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo 
sleep 2
source $SCRIPTPATH/inc/app-stop.sh
sleep 2
echo
echo -e $YELLOW'--->Making '$APPTITLE' only accessible from localhost...'$ENDCOLOR
sudo sed -i 's@ControlIP=0.0.0.0@ControlIP=localhost@g' $APPSETTINGS  || { echo -e $RED'Modifying ControlIP in '$APPSETTINGS' file failed.'$ENDCOLOR; exit 1; }
sleep 2
source $SCRIPTPATH/inc/app-start.sh
sleep 2
source $SCRIPTPATH/inc/app-install-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
