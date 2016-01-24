#!/bin/bash
# Script Name: AtoMiC SickRage Updater
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

echo -e $GREEN'AtoMiC SickRage Manual Update Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

if [ ! -d "/home/$UNAME/.sickrage" ]; 
then
	echo -e $RED'Error! '$CYAN'/home/'$UNAME/'.sickrage'$RED' not found. SickRage not installed or incompatible installation.'$ENDCOLOR
	source $SCRIPTPATH/inc/exit.sh
fi

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install git-core

echo
sleep 1

echo -e $YELLOW'--->Stopping SickRage...'$ENDCOLOR
sudo /etc/init.d/sickrage stop >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Stashing any changes made to SickRage...'$ENDCOLOR
cd /home/$UNAME/.sickrage
source $SCRIPTPATH/inc/gitstash.sh

echo
sleep 1

echo -e $YELLOW'--->Manually updating SickRage...'$ENDCOLOR
git fetch --all
git pull

echo
sleep 1

echo -e $YELLOW'--->Restarting SickRage...'$ENDCOLOR
/etc/init.d/sickrage start

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'SickRage should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/sickrage start'$ENDCOLOR' command.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
