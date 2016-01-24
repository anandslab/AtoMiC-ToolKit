#!/bin/bash
# Script Name: AtoMiC qBittorrent Uninstaller
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

echo -e $GREEN'AtoMiC qBittorrent Uninstaller Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW'--->Stopping qBittorrent...'$ENDCOLOR
sudo service qbittorrent-nox-daemon stop >/dev/null 2>&1
sudo killall qbittorrent-nox >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Uninstalling qBittorrent...'$ENDCOLOR
sudo apt-get -y remove qbittorrent-nox

echo
sleep 1

echo -e $YELLOW'--->Removing qBittorrent Autostart scripts...'$ENDCOLOR
sudo update-rc.d -f qbittorrent-nox-daemon remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
sudo rm /etc/init.d/qbittorrent-nox-daemon || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }

echo
sleep 1

echo -e $GREEN'Do you want to keep qBittorrent configuration files in case you want to reinstall later?'$ENDCOLOR
read -p 'Type y/Y to keep files or any other key to delete files, and press [ENTER] : '
FILEDEL=${REPLY,,}

if [ "$FILEDEL" != "y" ] 
then
	echo
	echo -e $YELLOW'--->Deleting qBittorrent files from '$CYAN'/home/'$UNAME'/.config/qBittorrent'$YELLOW'...'$ENDCOLOR
	sudo rm -r /home/$UNAME/.config/qBittorrent >/dev/null 2>&1
else
	echo
	echo -e $YELLOW'--->Keeping qBittorrent files in '$CYAN'/home/'$UNAME'/.config/qBittorrent'$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

echo -e $GREEN'--->All done.'$ENDCOLOR
echo -e 'qBittorrent Uninstalled.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
