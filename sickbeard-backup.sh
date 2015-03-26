#!/bin/bash
# Script Name: AtoMiC Sick Beard Backup Script
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
echo -e "                __     __           "
echo -e "  /\ |_ _ |\/|./      (_  _ _. _ |_ "
echo -e " /--\|_(_)|  ||\__    __)(_| ||_)|_ "
echo -e "                              |     "
echo -e $GREEN'AtoMiC Sick Beard Backup Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->Sick Beard backup will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. Best used to backup Sick Beard installed using AtoMiC ToolKit or '$CYAN'www.htpcBeginner.com'$ENDCOLOR' guides.'

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
fi

echo 

echo -n 'Type the username of the user you run Sick Beard as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
	echo -e $RED'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo ./setup.sh
fi
UGROUP=($(id -gn $UNAME))

cd $SCRIPTPATH
cp sickbeard-backup-files sb-backup-files
sudo sed -i 's/UNAME/'$UNAME'/g' sickbeard-backup-files  || { echo -e $RED'Replacing username in backup list failed.'$ENDCOLOR ; exit 1; }
tar -zcvf sickbeard_`date '+%m-%d-%Y_%H-%M'`.tar.gz --files-from sb-backup-files
sudo chown $UNAME:$UGROUP sickbeard_`date '+%m-%d-%Y_%H-%M'`.tar.gz
sudo chmod 755 sickbeard_`date '+%m-%d-%Y_%H-%M'`.tar.gz
mv sickbeard_`date '+%m-%d-%Y_%H-%M'`.tar.gz /home/$UNAME/
rm sb-backup-files


