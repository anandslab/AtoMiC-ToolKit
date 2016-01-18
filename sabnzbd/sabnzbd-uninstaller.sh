#!/bin/bash
# Script Name: AtoMiC SABnzbd Uninstaller
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

echo -e $GREEN'AtoMiC SABnzbd Uninstaller Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW'--->Stopping SABnzbd...'$ENDCOLOR
sudo service sabnzbdplus stop >/dev/null 2>&1
sudo killall sabnzbdplus >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Uninstalling SABnzbd...'$ENDCOLOR
sudo apt-get -y remove sabnzbdplus*

echo
sleep 1

echo -e $YELLOW'--->Removing SABnzbd Autostart scripts...'$ENDCOLOR
sudo update-rc.d -f sabnzbdplus remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
sudo rm /etc/default/sabnzbdplus || { echo -e $RED'Warning! Removing default script failed.'$ENDCOLOR ; }
sudo rm /etc/init.d/sabnzbdplus || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }

echo
sleep 1

echo -e $GREEN'Do you want to keep SABnzbd configuration files in case you want to reinstall later?'$ENDCOLOR
read -p 'Type y/Y to keep files or any other key to delete files, and press [ENTER] : '
FILEDEL=${REPLY,,}

if [ "$FILEDEL" != "y" ] 
then
	echo
	echo -e $YELLOW'--->Deleting SABnzbd files from '$CYAN'/home/'$UNAME'/.sabnzbd'$YELLOW'...'$ENDCOLOR
	sudo rm -r /home/$UNAME/.sabnzbd >/dev/null 2>&1
else
	echo
	echo -e $YELLOW'--->Keeping SABnzbd files in '$CYAN'/home/'$UNAME'/.sabnzbd'$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

echo -e $GREEN'--->All done.'$ENDCOLOR
echo -e 'SABnzbd Uninstalled.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
