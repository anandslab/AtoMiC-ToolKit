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

echo -e $YELLOW'--->Stopping Webmin...'$ENDCOLOR
sudo /etc/init.d/webmin stop >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Checking for existing files...'$ENDCOLOR
sleep 1
cd /etc/webmin
if [ -f "/etc/webmin/miniserv.conf" ]; then
	sudo mv /etc/webmin/miniserv.conf /etc/webmin/miniserv.conf_previous
	echo -e 'Moved existing miniserv.conf to /etc/webmin/miniserv.conf_previous'$ENDCOLOR
fi

echo
sleep 1

echo -e $YELLOW'--->Select Webmin Settings backup file to restore...'$ENDCOLOR
echo -e 'In the following file selection box use ARROW or TAB keys to move and SPACE key to select the backup file (with extension '$CYAN'tar.gz'$ENDCOLOR') to restore.'

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW'--->Installing necessary '$CYAN'dialog'$YELLOW' package...'$ENDCOLOR
sudo apt-get -y install dialog

BFILE=$(dialog --title "Restore Webmin Settings" --stdout --title "Choose backup file to restore. Use TAB or ARROW keys to move and SPACE to select." --fselect /$SCRIPTPATH/backups/ 15 120)

if [ -f $BFILE ] 
then
	if [[ $BFILE == *.tar.gz ]]
	then
		echo -e 'Restoring the following files from: '$CYAN$BFILE$ENDCOLOR
		tar -C / -zxvf $BFILE || { echo -e $RED'Extracting files failed.'$ENDCOLOR ; exit 1; }
		echo
        sleep 1
        echo -e $YELLOW'--->Restarting Webmin...'$ENDCOLOR
		/etc/init.d/webmin start
		sleep 1
	else
		echo -e $RED'Error! Selected file is not a backup file with '$CYAN'tar.gz'$RED' extension. Exiting now. Please rerun script.'$ENDCOLOR
		source $SCRIPTPATH/inc/exit.sh
	fi
else
	echo -e $RED'Error! No file selected. Exiting now. Please rerun script.'$ENDCOLOR
	source $SCRIPTPATH/inc/exit.sh
fi 

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'Webmin settings restored.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
