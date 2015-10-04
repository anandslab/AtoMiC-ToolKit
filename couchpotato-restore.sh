#!/bin/bash
# Script Name: AtoMiC CouchPotato Restore Script
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
YELLOW='\e[93m'
RED='\e[91m'
ENDCOLOR='\033[0m'
CYAN='\e[96m'
GREEN='\e[92m'
SCRIPTPATH=$(pwd)

function pause(){
   read -p "$*"
}

clear
echo 
echo -e $RED
echo -e " ┬ ┬┬ ┬┬ ┬ ┬ ┬┌┬┐┌─┐┌─┐┌┐ ┌─┐┌─┐┬┌┐┌┌┐┌┌─┐┬─┐ ┌─┐┌─┐┌┬┐"
echo -e " │││││││││ ├─┤ │ ├─┘│  ├┴┐├┤ │ ┬│││││││├┤ ├┬┘ │  │ ││││"
echo -e " └┴┘└┴┘└┴┘o┴ ┴ ┴ ┴  └─┘└─┘└─┘└─┘┴┘└┘┘└┘└─┘┴└─o└─┘└─┘┴ ┴"
echo -e $CYAN
echo -e "                __  ___             "
echo -e "  /\ |_ _ |\/|./     | _  _ ||_/.|_ "
echo -e " /--\|_(_)|  ||\__   |(_)(_)|| \||_ "
echo
echo -e $GREEN'AtoMiC CouchPotato Restore Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->CouchPotato backup will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. Best used to restore CouchPotato backed up using AtoMiC ToolKit or '$CYAN'www.htpcBeginner.com'$ENDCOLOR' guides.'
echo -e '5. CouchPotato should already be installed before restoring library and settings.'

echo

read -p 'Type y/Y and press [ENTER] to AGREE and continue with the installation or any other key to exit: '
RESP=${REPLY,,}

if [ "$RESP" != "y" ] 
then
	echo -e $RED'So you chickened out. May be you will try again later.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo ./setup.sh
	exit 0
fi

echo 

echo -n 'Type the username of the user you run CouchPotato as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
	echo -e $RED'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo ./setup.sh
	exit 0
fi
UGROUP=($(id -gn $UNAME))

echo

if [ ! -d "/home/$UNAME/.couchpotato" ]; 
then
	echo -e $RED'Error! '$CYAN'/home/'$UNAME/'.couchpotato'$RED' not found. Ensure that CouchPotato is installed. Exiting now. Please rerun script.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo ./setup.sh
	exit 0
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

echo

pause 'Press [Enter] key to continue...'

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
		echo
		pause 'Press [Enter] key to continue...'
		cd $SCRIPTPATH
		sudo ./setup.sh
		exit 0
	fi
else
	echo -e $RED'Error! No file selected. Exiting now. Please rerun script.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo ./setup.sh
	exit 0
fi 

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'CouchPotato files restored.'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC CouchPotato Restore script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
exit 0
