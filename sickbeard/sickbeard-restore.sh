#!/bin/bash
# Script Name: AtoMiC Sick Beard Restore Script
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

echo -e $GREEN'AtoMiC Sick Beard Restore Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

if [ ! -d "/home/$UNAME/.sickbeard" ]; 
then
	echo -e $RED'Error! '$CYAN'/home/'$UNAME/'.sickbeard'$RED' not found. Sick Beard not installed or incompatible installation.'$ENDCOLOR
	source $SCRIPTPATH/inc/exit.sh
fi

echo

echo -e $YELLOW'--->Stopping Sick Beard...'$ENDCOLOR
sleep 1
sudo /etc/init.d/sickbeard stop >/dev/null 2>&1

echo

echo -e $YELLOW'--->Checking for existing files...'$ENDCOLOR
sleep 1
cd /home/$UNAME
if [ -f "/home/$UNAME/.sickbeard/sickbeard.db" ]; then
	mv /home/$UNAME/.sickbeard/sickbeard.db /home/$UNAME/.sickbeard/sickbeard.db_previous
	echo -e 'Moved existing sickbeard.db to '$CYAN'/home/'$UNAME'/.sickbeard/sickbeard.db_previous'$ENDCOLOR
fi

if [ -f "/home/$UNAME/.sickbeard/cache.db" ]; then
	mv /home/$UNAME/.sickbeard/cache.db /home/$UNAME/.sickbeard/cache.db_previous
	echo -e 'Moved existing cache.db to '$CYAN'/home/'$UNAME'/.sickbeard/cache.db_previous'$ENDCOLOR
fi

if [ -f "/home/$UNAME/.sickbeard/failed.db" ]; then
	mv /home/$UNAME/.sickbeard/failed.db /home/$UNAME/.sickbeard/failed.db_previous
	echo -e 'Moved existing failed.db to '$CYAN'/home/'$UNAME'/.sickbeard/failed.db_previous'$ENDCOLOR
fi

if [ -f "/home/$UNAME/.sickbeard/config.ini" ]; then
	mv /home/$UNAME/.sickbeard/config.ini /home/$UNAME/.sickbeard/config.ini_previous
	echo -e 'Moved existing config.ini to '$CYAN'/home/'$UNAME'/.sickbeard/config.ini_previous'$ENDCOLOR
fi

if [ -f "/home/$UNAME/.sickbeard/autoProcessTV/autoProcessTV.cfg" ]; then
	mv /home/$UNAME/.sickbeard/autoProcessTV/autoProcessTV.cfg /home/$UNAME/.sickbeard/autoProcessTV/autoProcessTV.cfg_previous
	echo -e 'Moved existing autoProcessTV.cfg to '$CYAN'/home/'$UNAME'/.sickbeard/autoProcessTV/autoProcessTV.cfg_previous'$ENDCOLOR
fi

echo
sleep 1

echo -e $YELLOW'--->Select Sick Beard backup file to restore...'$ENDCOLOR
echo -e 'In the following file selection box use ARROW or TAB keys to move and SPACE key to select the backup file (with extension '$CYAN'tar.gz'$ENDCOLOR') to restore.'

echo

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW'--->Installing necessary '$CYAN'dialog'$YELLOW' package...'$ENDCOLOR
sudo apt-get -y install dialog

BFILE=$(dialog --title "Restore Sick Beard" --stdout --title "Choose backup file to restore. Use TAB or ARROW keys to move and SPACE to select." --fselect /home/$UNAME/ 15 120)

if [ -f $BFILE ] 
then
	if [[ $BFILE == *.tar.gz ]]
	then
		echo -e 'Restoring the following files from: '$CYAN$BFILE$ENDCOLOR
		tar -C / -zxvf $BFILE || { echo -e $RED'Extracting files failed.'$ENDCOLOR ; exit 1; }
		echo
		sleep 1
		/etc/init.d/sickbeard start
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
echo -e 'Sick Beard files restored.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
