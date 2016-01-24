#!/bin/bash
# Script Name: AtoMiC Sonarr / NzbDrone Uninstaller
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

echo -e $GREEN'AtoMiC Sonarr / NzbDrone Uninstaller Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW'--->Stopping Sonarr...'$ENDCOLOR
sudo service nzbdrone stop >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Removing Sonarr Autostart scripts...'$ENDCOLOR
sudo update-rc.d -f nzbdrone remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
sudo rm /etc/init.d/nzbdrone || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }
sudo apt-get -y remove nzbdrone

echo
sleep 1

echo -e $GREEN'Do you want to keep Sonarr config files as a backup or for reinstalling later?'$ENDCOLOR
read -p 'Type y/Y to keep files or any other key to delete files, and press [ENTER] : '
FILEDEL=${REPLY,,}

if [ "$FILEDEL" != "y" ] 
then
	echo
	echo -e $YELLOW'--->Deleting Sonarr files from '$CYAN'/home/'$UNAME'/.config/NzbDrone'$YELLOW'...'$ENDCOLOR
	sudo rm -r /home/$UNAME/.config/NzbDrone
else
	echo
	echo -e $YELLOW'--->Keeping Sonarr config files in '$CYAN'/home/'$UNAME'/.config/NzbDrone'$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

echo -e $GREEN'--->All done.'$ENDCOLOR
echo -e 'Sonarr Uninstalled.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
