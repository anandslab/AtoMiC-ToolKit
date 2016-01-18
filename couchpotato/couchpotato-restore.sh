#!/bin/bash
# Script Name: AtoMiC CouchPotato Restore Script
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

echo -e $GREEN'AtoMiC CouchPotato Restore Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

if [ ! -d "/home/$UNAME/.couchpotato" ]; 
then
	echo -e $RED'Error! '$CYAN'/home/'$UNAME/'.couchpotato'$RED' not found. CouchPotato not installed or incompatible installation.'$ENDCOLOR
	source $SCRIPTPATH/inc/exit.sh
fi

echo -e $YELLOW'--->Checking for existing files...'$ENDCOLOR
sleep 1
cd /home/$UNAME
if [ -f "/home/$UNAME/.couchpotato/settings.conf" ]; then
	mv /home/$UNAME/.couchpotato/settings.conf /home/$UNAME/.couchpotato/settings.conf_previous
	echo -e 'Moved existing settings.conf to '$CYAN'/home/'$UNAME'/.couchpotato/settings.conf_previous'$ENDCOLOR
fi

if [ -f "/home/$UNAME/.couchpotato/cache" ]; then
	mv /home/$UNAME/.couchpotato/cache /home/$UNAME/.couchpotato/cache_previous
	echo -e 'Moved existing cache folder to '$CYAN'/home/'$UNAME'/.couchpotato/cache_previous'$ENDCOLOR
fi

if [ -f "/home/$UNAME/.couchpotato/database" ]; then
	mv /home/$UNAME/.couchpotato/database /home/$UNAME/.couchpotato/database_previous
	echo -e 'Moved existing database folder to '$CYAN'/home/'$UNAME'/.couchpotato/database_previous'$ENDCOLOR
fi

if [ -f "/home/$UNAME/.couchpotato/db_backup" ]; then
	mv /home/$UNAME/.couchpotato/db_backup /home/$UNAME/.couchpotato/db_backup_previous
	echo -e 'Moved existing db_backup folder to '$CYAN'/home/'$UNAME'/.couchpotato/db_backup_previous'$ENDCOLOR
fi

if [ -f "/home/$UNAME/.couchpotato/logs/CouchPotato.log" ]; then
	mv /home/$UNAME/.couchpotato/logs/CouchPotato.log /home/$UNAME/.couchpotato/logs/CouchPotato.log_previous
	echo -e 'Moved existing CouchPotato.log to '$CYAN'/home/'$UNAME'/.couchpotato/logs/CouchPotato.log_previous'$ENDCOLOR
fi
if [ -f "/home/$UNAME/.couchpotato/logs/error.log" ]; then
	mv /home/$UNAME/.couchpotato/logs/error.log /home/$UNAME/.couchpotato/logs/error.log_previous
	echo -e 'Moved existing error.log to '$CYAN'/home/'$UNAME'/.couchpotato/logs/error.log_previous'$ENDCOLOR
fi

echo
sleep 1

echo -e $YELLOW'--->Select CouchPotato backup file to restore...'$ENDCOLOR
echo -e 'In the following file selection box use ARROW or TAB keys to move and SPACE key to select the backup file (with extension '$CYAN'tar.gz'$ENDCOLOR') to restore.'

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW'--->Installing necessary '$CYAN'dialog'$YELLOW' package...'$ENDCOLOR
sudo apt-get -y install dialog

BFILE=$(dialog --title "Restore CouchPotato" --stdout --title "Choose backup file to restore. Use TAB or ARROW keys to move and SPACE to select." --fselect /home/$UNAME/ 15 120)

if [ -f $BFILE ] 
then
	if [[ $BFILE == *.tar.gz ]]
	then
		echo -e 'Restoring the following files from: '$CYAN$BFILE$ENDCOLOR
		tar -C / -zxvf $BFILE || { echo -e $RED'Extracting files failed.'$ENDCOLOR ; exit 1; }
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
echo -e 'CouchPotato files restored.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh

