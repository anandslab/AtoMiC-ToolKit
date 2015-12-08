#!/bin/bash
# Script Name: AtoMiC headphones Installer
# Author: carrigan98
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
echo -e $GREEN'AtoMiC Headphones Installer Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->Headphones installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure Headphones.'
echo -e '5. Best used on a clean system (with no previous headphones install) or after complete removal of previous Headphones installation.'

echo
echo -n 'Type the username of the user you want to run Headphones as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
	echo -e $RED'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	exit 0
fi
UGROUP=($(id -gn $UNAME))

echo

echo -e $YELLOW'--->Refreshing packages list...'$ENDCOLOR
sudo apt-get update

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install git-core python

echo
sleep 1

echo -e $YELLOW'--->Checking for previous versions of headphones...'$ENDCOLOR
sleep 1
sudo /etc/init.d/headphones stop >/dev/null 2>&1
echo -e 'Any running headphones processes stopped'
sleep 1
sudo update-rc.d -f headphones remove >/dev/null 2>&1
sudo rm /etc/init.d/headphones >/dev/null 2>&1
sudo rm /etc/default/headphones >/dev/null 2>&1
echo -e 'Any existing headphones init scripts removed'
sleep 1
sudo update-rc.d -f headphones remove >/dev/null 2>&1
if [ -d "/home/$UNAME/.headphones" ]; then
	mv /home/$UNAME/.headphones /home/$UNAME/.headphones_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing headphones files were moved to '$CYAN'/home/'$UNAME'/.headphones_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous Headphones folder found'
fi

echo
sleep 1

echo -e $YELLOW'--->Downloading latest headphones...'$ENDCOLOR
cd /home/$UNAME
git clone https://github.com/rembo10/headphones.git /home/$UNAME/.headphones || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME:$UGROUP /home/$UNAME/.headphones >/dev/null 2>&1
sudo chmod 775 -R /home/$UNAME/.headphones >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Configuring headphones Install...'$ENDCOLOR
cd /home/$UNAME/.headphones/init-scripts
echo "# COPY THIS FILE TO /etc/default/headphones" >> headphones || { echo 'Could not create default file.' ; exit 1; }
echo "# OPTIONS: HP_HOME, HP_USER, HP_DATA, HP_PIDFILE, PYTHON_BIN, HP_OPTS, SSD_OPTS" >> headphones
echo "HP_HOME=/home/"$UNAME"/.headphones/" >> headphones
echo "HP_DATA=/home/"$UNAME"/.headphones/" >> headphones
echo 'HP_OPTS=" --config=/home/'$UNAME'/.headphones/config.ini"' >> headphones

echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run headphones...'
echo "HP_USER="$UNAME >> headphones
sudo mv headphones /etc/default/

echo
sleep 1

echo -e $YELLOW'--->Enabling headphones AutoStart at Boot...'$ENDCOLOR
sudo cp init.ubuntu /etc/init.d/headphones || { echo $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME: /etc/init.d/headphones
sudo chmod +x /etc/init.d/headphones
sudo update-rc.d headphones defaults

echo
sleep 1

echo -e 'Stashing any changes made to headphones...'
cd /home/$UNAME/.headphones
git config user.email “atomic@htpcbeginner.com”
git config user.name “AtoMiCUser”
git stash
git stash clear

echo
sleep 1

echo -e 'Starting headphones'
sudo /etc/init.d/headphones start >/dev/null 2>&1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'Headphones should start within 10-20 seconds.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/headphones start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8181'$ENDCOLOR' in your browser.'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC Headphones Install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

cd $SCRIPTPATH
sleep 5

exit 0
