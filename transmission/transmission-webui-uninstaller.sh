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

echo -e $GREEN'AtoMiC Transmission Uninstaller Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW'--->Stopping Transmission...'$ENDCOLOR
sudo service transmission-daemon stop >/dev/null 2>&1
sudo killall transmission-daemon >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Uninstalling Transmission...'$ENDCOLOR
sudo apt-get -y remove transmission-cli transmission-common transmission-daemon

echo
sleep 1

echo -e $YELLOW'--->Removing Transmission Autostart scripts...'$ENDCOLOR
sudo update-rc.d -f transmission-daemon remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
sudo rm /etc/init.d/transmission-daemon || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }

echo
sleep 1

echo -e $GREEN'Do you want to keep Transmission configuration files in case you want to reinstall later?'$ENDCOLOR
read -p 'Type y/Y to keep files or any other key to delete files, and press [ENTER] : '
FILEDEL=${REPLY,,}

if [ "$FILEDEL" != "y" ] 
then
	echo
	echo -e $YELLOW'--->Deleting Transmission files from '$CYAN'/home/'$UNAME'/.config/transmission'$YELLOW'...'$ENDCOLOR
	sudo rm -r /home/$UNAME/.config/transmission >/dev/null 2>&1
else
	echo
	echo -e $YELLOW'--->Keeping Transmission files in '$CYAN'/home/'$UNAME'/.config/transmission'$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

echo -e $GREEN'You may keep Transmission downloads folder that has completed and incomplete downloads.'$ENDCOLOR
read -p 'Type y/Y to keep folder or any other key to delete folder, and press [ENTER] : '
FILEDELE=${REPLY,,}

if [ "$FILEDELE" != "y" ] 
then
	echo
	echo -e $YELLOW'--->Deleting Transmission downloads folder '$CYAN'/home/'$UNAME'/Downloads/transmission'$YELLOW'...'$ENDCOLOR
	sudo rm -r /home/$UNAME/Downloads/transmission >/dev/null 2>&1
else
	echo
	echo -e $YELLOW'--->Keeping Transmission downloads folder '$CYAN'/home/'$UNAME'/Downloads/transmission'$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

echo -e $GREEN'--->All done.'$ENDCOLOR
echo -e 'Transmission Uninstalled.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
