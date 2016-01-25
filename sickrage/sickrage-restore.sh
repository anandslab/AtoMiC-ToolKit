#!/bin/bash
# Script Name: AtoMiC SickRage Restore Script
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

echo -e $GREEN'AtoMiC SickRage Restore Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

if [ ! -d "/home/$UNAME/.sickrage" ]; 
then
	echo -e $RED'Error! '$CYAN'/home/'$UNAME/'.sickrage'$RED' not found. SickRage not installed or incompatible installation.'$ENDCOLOR
	source $SCRIPTPATH/inc/exit.sh
fi

sleep 1

echo -e $YELLOW'--->Select SickBeard Settings backup file to restore...'$ENDCOLOR

echo
sleep 1

APPNAME='sickrage'
source $SCRIPTPATH/inc/fileselect.sh

if [ $exitstatus = 0 ]; then
	BFILE=$SCRIPTPATH'/backups/'$FILECHOICE
    
    echo -e $YELLOW'--->Stopping SickRage...'$ENDCOLOR
	sudo /etc/init.d/sickrage stop >/dev/null 2>&1

	echo
	sleep 1

	echo -e $YELLOW'--->Checking for existing files...'$ENDCOLOR
	sleep 1
	DATETIME=`date '+%m-%d-%Y_%H-%M'`
	if [ -f "/home/$UNAME/.sickrage/sickbeard.db" ]; then
		mv /home/$UNAME/.sickrage/sickbeard.db /home/$UNAME/.sickrage/sickbeard.db_$DATETIME
		echo -e 'Moved existing sickbeard.db to '$CYAN'/home/'$UNAME'/.sickrage/sickbeard.db_'$DATETIME$ENDCOLOR
	fi
	if [ -f "/home/$UNAME/.sickrage/cache.db" ]; then
		mv /home/$UNAME/.sickrage/cache.db /home/$UNAME/.sickrage/cache.db_$DATETIME
		echo -e 'Moved existing cache.db to '$CYAN'/home/'$UNAME'/.sickrage/cache.db_'$DATETIME$ENDCOLOR
	fi
	if [ -f "/home/$UNAME/.sickrage/failed.db" ]; then
		mv /home/$UNAME/.sickrage/failed.db /home/$UNAME/.sickrage/failed.db_$DATETIME
		echo -e 'Moved existing failed.db to '$CYAN'/home/'$UNAME'/.sickrage/failed.db_'$DATETIME$ENDCOLOR
	fi
	if [ -f "/home/$UNAME/.sickrage/config.ini" ]; then
		mv /home/$UNAME/.sickrage/config.ini /home/$UNAME/.sickrage/config.ini_$DATETIME
		echo -e 'Moved existing config.ini to '$CYAN'/home/'$UNAME'/.sickrage/config.ini_'$DATETIME$ENDCOLOR
	fi
	if [ -f "/home/$UNAME/.sickrage/autoProcessTV/autoProcessTV.cfg" ]; then
		mv /home/$UNAME/.sickrage/autoProcessTV/autoProcessTV.cfg /home/$UNAME/.sickrage/autoProcessTV/autoProcessTV.cfg_$DATETIME
		echo -e 'Moved existing autoProcessTV.cfg to '$CYAN'/home/'$UNAME'/.sickrage/autoProcessTV/autoProcessTV.cfg_'$DATETIME$ENDCOLOR
	fi

	echo
	sleep 1

	echo -e 'Restoring the following files from: '$CYAN$BFILE$ENDCOLOR
	tar -C / -zxvf $BFILE || { echo -e $RED'Extracting files failed.'$ENDCOLOR ; exit 1; }

	echo
    sleep 1
    
    echo -e $YELLOW'--->Restarting SickRage...'$ENDCOLOR
	/etc/init.d/sickrage start
	
    echo
    sleep 1
	
    echo
	echo -e $GREEN'--->All done. '$ENDCOLOR
	echo -e 'SickRage files restored.'
    source $SCRIPTPATH/inc/thankyou.sh
	source $SCRIPTPATH/inc/exit.sh
else
    echo
    echo -e $RED'Restoring backup cancelled.'$ENDCOLOR
    source $SCRIPTPATH/inc/pause.sh
    source $SCRIPTPATH/inc/sickrage-menu.sh
fi 
