#!/bin/bash
# Script Name: AtoMiC HTPC Manager Installer
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
echo -e $GREEN'AtoMiC HTPC Manager Installer Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->HTPC Manager installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure HTPC Manager.'
echo -e '5. Best used on a clean system (with no previous HTPC Manager install) or after complete removal of previous HTPC Manager installation.'

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

echo -n 'Type the username of the user you want to run HTPC Manager as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
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

echo -e $YELLOW'--->Refreshing packages list...'$ENDCOLOR
#sudo apt-get update

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install build-essential git python-imaging python-dev python-setuptools python-pip python-cherrypy vnstat 
sudo pip install psutil

echo
sleep 1

echo -e $YELLOW'--->Checking for previous versions of HTPC Manager...'$ENDCOLOR
sleep 1
sudo /etc/init.d/htpcmanager stop >/dev/null 2>&1
echo -e 'Any running HTPC Manager processes stopped'
sleep 1
sudo update-rc.d -f htpcmanager remove >/dev/null 2>&1
sudo rm /etc/init.d/htpcmanager >/dev/null 2>&1
sudo rm /etc/default/htpcmanager >/dev/null 2>&1
echo -e 'Any existing HTPC Manager init scripts removed'
sleep 1
sudo update-rc.d -f htpcmanager remove >/dev/null 2>&1
if [ -d "/home/$UNAME/.htpcmanager" ]; then
	mv /home/$UNAME/.htpcmanager /home/$UNAME/.htpcmanager_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing HTPC Manager files were moved to '$CYAN'/home/'$UNAME'/.htpcmanager_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous HTPC Manager folder found'
fi

echo
sleep 1

echo -e $YELLOW'--->Downloading latest HTPC Manager...'$ENDCOLOR
cd /home/$UNAME
git clone https://github.com/styxit/HTPC-Manager.git /home/$UNAME/.htpcmanager || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME:$UGROUP /home/$UNAME/.htpcmanager >/dev/null 2>&1
sudo chmod 775 -R /home/$UNAME/.htpcmanager >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Copying init and config file...'$ENDCOLOR
sudo cp $SCRIPTPATH/htpcmanager-init /etc/init.d/htpcmanager || { echo -e $RED'Init file not copied.'$ENDCOLOR ; exit 1; }
sudo chmod 755 /etc/init.d/htpcmanager

echo 
sleep 1

echo -e $YELLOW"--->Making some configuration changes..."$ENDCOLOR
sudo sed -i 's/MyUserName/'$UNAME'/g' /etc/init.d/htpcmanager || { echo -e $RED'Replacing username in default failed.'$ENDCOLOR ; exit 1; }

echo 
sleep 1

echo -e $YELLOW'--->Enabling HTPC Manager AutoStart at Boot...'$ENDCOLOR
sudo update-rc.d htpcmanager defaults

echo
sleep 1

echo -e 'Stashing any changes made to HTPC Manager...'
cd /home/$UNAME/.htpcmanager
git config user.email “atomic@htpcbeginner.com”
git config user.name “AtoMiCUser”
git stash
git stash clear

echo
sleep 1

echo -e 'Starting HTPC Manager'
sudo /etc/init.d/htpcmanager start >/dev/null 2>&1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'HTPC Manager should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/htpcmanager start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8085'$ENDCOLOR' in your browser.'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC HTPC Manager Install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
exit 0
