#!/bin/bash
# Script Name: AtoMiC Webmin Uninstaller
# Author: carrigan98
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

echo -e $GREEN'AtoMiC Webmin Uninstaller Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW'--->Stopping Webmin...'$ENDCOLOR
sudo /etc/init.d/webmin stop >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Uninstalling Webmin...'$ENDCOLOR
sudo apt-get -y remove webmin 

echo 
sleep 1

echo -e $GREEN'--->All done.'$ENDCOLOR
echo -e 'Webmin Uninstalled.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
