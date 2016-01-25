#!/bin/bash
# Script Name: AtoMiC Webmin Settings Restore Script
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

echo -e $GREEN'AtoMiC Webmin Settings Restore Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

if [ ! -d "/etc/webmin" ]; 
then
	echo -e $RED'Error! /etc/webmin not found. Webmin not installed or incompatible installation.'$ENDCOLOR
	source $SCRIPTPATH/inc/exit.sh
fi

sleep 1

echo -e $YELLOW'--->Select Webmin Settings backup file to restore...'$ENDCOLOR

echo
sleep 1

APPNAME='webmin'
source $SCRIPTPATH/inc/fileselect.sh

if [ $exitstatus = 0 ]; then
	BFILE=$SCRIPTPATH'/backups/'$FILECHOICE
    
    echo -e $YELLOW'--->Stopping Webmin...'$ENDCOLOR
	sudo /etc/init.d/webmin stop >/dev/null 2>&1
	
    echo
	sleep 1
	
    echo -e $YELLOW'--->Checking for existing files...'$ENDCOLOR
    sleep 1
    DATETIME=`date '+%m-%d-%Y_%H-%M'`
	if [ -f "/etc/webmin/miniserv.conf" ]; then
		sudo mv /etc/webmin/miniserv.conf /etc/webmin/miniserv.conf_$DATETIME
		echo -e 'Moved existing miniserv.conf to /etc/webmin/miniserv.conf_'$DATETIME$ENDCOLOR
	fi
	
    echo
    sleep 1
    
    echo -e 'Restoring the following files from: '$CYAN$BFILE$ENDCOLOR
	tar -C / -zxvf $BFILE || { echo -e $RED'Extracting files failed.'$ENDCOLOR ; exit 1; }
	
    echo
    sleep 1
    
    echo -e $YELLOW'--->Restarting Webmin...'$ENDCOLOR
	/etc/init.d/webmin start
	
    echo
	sleep 1
    
    echo -e $GREEN'--->All done. '$ENDCOLOR
	echo -e 'Webmin settings restored.'
    source $SCRIPTPATH/inc/thankyou.sh
	source $SCRIPTPATH/inc/exit.sh
else
    echo
    echo -e $RED'Restoring backup cancelled.'$ENDCOLOR
    source $SCRIPTPATH/inc/pause.sh
    source $SCRIPTPATH/inc/webmin-menu.sh
fi