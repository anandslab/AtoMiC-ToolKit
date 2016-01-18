#!/bin/bash
# Script Name: AtoMiC SickGear Uninstaller
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $1 != *"setup.sh"* ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi

source $2/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN'AtoMiC SickGear Uninstaller Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW'--->Stopping SickGear...'$ENDCOLOR
sudo /etc/init.d/sickgear stop >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Removing SickGear Autostart scripts...'$ENDCOLOR
sudo update-rc.d -f sickgear remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
sudo rm /etc/default/sickgear || { echo -e $RED'Warning! Removing default script failed.'$ENDCOLOR ; }
sudo rm /etc/init.d/sickgear || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }

echo
sleep 1

echo -e $GREEN'Do you want to keep SickGear installation files as a backup or for reinstalling later?'$ENDCOLOR
read -p 'Type y/Y to keep files or any other key to delete files, and press [ENTER] : '
FILEDEL=${REPLY,,}

if [ "$FILEDEL" != "y" ] 
then
	echo
	echo -e $YELLOW'--->Deleting SickGear files from '$CYAN'/home/'$UNAME'/.sickgear'$YELLOW'...'$ENDCOLOR
	sudo rm -r /home/$UNAME/.sickgear
else
	echo
	echo -e $YELLOW'--->Keeping SickGear files in '$CYAN'/home/'$UNAME'/.sickgear'$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

echo -e $GREEN'--->All done.'$ENDCOLOR
echo -e 'SickGear Uninstalled.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
