#!/bin/bash
# Script Name: AtoMiC SABnzbd Installer
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
echo -e " - -- -- - - -+-++-++-+++ +-++-+-+++++++-+--+ +-++-++-+"
echo -e " ¦¦¦¦¦¦¦¦¦ +-¦ ¦ +-+¦  +-++¦ ¦ -¦¦¦¦¦¦¦+¦ +-+ ¦  ¦ ¦¦¦¦"
echo -e " +-++-++-+o- - - -  +-++-++-++-+-+++++++-+-+-o+-++-+- -"
echo -e $CYAN
echo -e "                __     __           "
echo -e "  /\ |_ _ |\/|./      (_  _ _. _ |_ "
echo -e " /--\|_(_)|  ||\__    __)(_| ||_)|_ "
echo -e "                              |     "
echo -e $GREEN'AtoMiC SABnzbd Installer Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->SABnzbd installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure SABnzbd.'
echo -e '5. Best used on a clean system (with no previous SABnzbd install) or after complete removal of previous SABnzbd installation.'

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

echo -n 'Type the username of the user you want to run SABnzbd as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
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


sudo add-apt-repository ppa:jcfp/ppa
sudo apt-get update
sudo nano /etc/default/sabnzbdplus
USER=$UNAME
HOST=0.0.0.0
