#!/bin/bash
# Script Name: AtoMiC CouchPotato Restore Script
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

APPNAME='couchpotato'
APPPATH='/home/'$UNAME'/.couchpotato'

echo -e $GREEN'AtoMiC CouchPotato Backup Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo -e $GREEN'AtoMiC CouchPotato Restore Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

if [ ! -d "$APPPATH" ]; 
then
	echo -e $RED'Error! '$CYAN$APPPATH$RED' not found. CouchPotato not installed or incompatible installation.'$ENDCOLOR
    source $SCRIPTPATH/inc/pause.sh
    source $SCRIPTPATH/inc/couchpotato-menu.sh
fi

sleep 1

echo -e $YELLOW'--->Select CouchPotato Settings backup file to restore...'$ENDCOLOR

echo
sleep 1

APPNAME='couchpotato'
source $SCRIPTPATH/inc/fileselect.sh

if [ $exitstatus = 0 ]; then
	BFILE=$SCRIPTPATH'/backups/'$FILECHOICE

	echo -e $YELLOW'--->Stopping CouchPotato...'$ENDCOLOR
	sudo /etc/init.d/couchpotato stop >/dev/null 2>&1

	echo
	sleep 1

	echo -e $YELLOW'--->Checking for existing files...'$ENDCOLOR
    DATETIME=`date '+%m-%d-%Y_%H-%M'`
	if [ -f "$APPPATH/settings.conf" ]; then
		mv $APPPATH/settings.conf $APPPATH/settings.conf_$DATETIME
		echo -e 'Moved existing settings.conf to '$CYAN$APPPATH'/settings.conf_'$DATETIME$ENDCOLOR
	fi
	if [ -d "$APPPATH/cache" ]; then
		mv $APPPATH/cache $APPPATH/cache_$DATETIME
		echo -e 'Moved existing cache folder to '$CYAN$APPPATH'/cache_'$DATETIME$ENDCOLOR
	fi
	if [ -d "/home/$UNAME/.couchpotato/database" ]; then
		mv $APPPATH/database $APPPATH/database_$DATETIME
		echo -e 'Moved existing database folder to '$CYAN$APPPATH'/database_'$DATETIME$ENDCOLOR
	fi
	if [ -d "/home/$UNAME/.couchpotato/db_backup" ]; then
		mv $APPPATH/db_backup $APPPATH/db_backup_$DATETIME
		echo -e 'Moved existing db_backup folder to '$CYAN$APPPATH'/db_backup_'$DATETIME$ENDCOLOR
	fi
	if [ -f "/home/$UNAME/.couchpotato/logs/CouchPotato.log" ]; then
		mv $APPPATH/logs/CouchPotato.log $APPPATH/logs/CouchPotato.log_$DATETIME
		echo -e 'Moved existing CouchPotato.log to '$CYAN$APPPATH'/logs/CouchPotato.log_'$DATETIME$ENDCOLOR
	fi
	if [ -f "/home/$UNAME/.couchpotato/logs/error.log" ]; then
		mv $APPPATH/logs/error.log $APPPATH/logs/error.log_$DATETIME
		echo -e 'Moved existing error.log to '$CYAN$APPPATH'/logs/error.log_'$DATETIME$ENDCOLOR
	fi

	echo
	sleep 1

	echo -e 'Restoring the following files from: '$CYAN$BFILE$ENDCOLOR
	tar -C / -zxvf $BFILE || { echo -e $RED'Extracting files failed.'$ENDCOLOR ; exit 1; }

	echo
    sleep 1
    
    echo -e $YELLOW'--->Restarting CouchPotato...'$ENDCOLOR
	/etc/init.d/couchpotato start
	
    echo
    sleep 1
    
	echo -e $GREEN'--->All done. '$ENDCOLOR
	echo -e 'CouchPotato files restored.'
    source $SCRIPTPATH/inc/thankyou.sh
	source $SCRIPTPATH/inc/exit.sh
else
    echo
    echo -e $RED'Restoring backup cancelled.'$ENDCOLOR
    source $SCRIPTPATH/inc/pause.sh
    source $SCRIPTPATH/inc/couchpotato-menu.sh
fi 