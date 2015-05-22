#!/bin/bash
# Script Name: AtoMiC qBittorrent Installer
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
echo -e $GREEN'AtoMiC qBittorrent Installer Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->qBittorrent installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure qBittorrent.'
echo -e '5. Best used on a clean system (with no previous qBittorrent install) or after complete removal of previous qBittorrent installation.'

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

echo -n 'Type the username of the user you want to run qBittorrent as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
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
sleep 1

echo -e $YELLOW"--->Adding qBittorrent repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep qbittorrent)
if [ "$GREPOUT" == "" ]; then
    sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
else
    echo "qBittorrent PPA repository already exists..."
fi

echo
sleep 1

echo -e $YELLOW"--->Refreshing packages list again..."$ENDCOLOR
sudo apt-get update

echo
sleep 1

echo -e $YELLOW"--->Installing qBittorrent..."$ENDCOLOR
sudo apt-get -y install qbittorrent-nox

echo
sleep 1

echo -e $YELLOW'--->Copying init and config file...'$ENDCOLOR
sudo cp $SCRIPTPATH/qbittorrent-nox-daemon /etc/init.d/ || { echo -e $RED'Init file not copied.'$ENDCOLOR ; exit 1; }
sudo chmod 755 /etc/init.d/qbittorrent-nox-daemon

if [ ! -d "/home/$UNAME/.config/qBittorrent" ]; then
	mkdir /home/$UNAME/.config/qBittorrent
fi
if [ ! -f "/home/$UNAME/.config/qBittorrent/qBittorrent.conf" ];
then
	sudo cp $SCRIPTPATH/qBittorrent.conf /home/$UNAME/.config/qBittorrent/ || { echo -e $RED'Conf file not copied.'$ENDCOLOR ; exit 1; }
else 
	echo -e 'Using the existing qBittorrent.conf file.'
fi
sudo chown -R $UNAME: /home/$UNAME/.config/qBittorrent

echo 
sleep 1

echo -e $YELLOW"--->Making some configuration changes..."$ENDCOLOR
sudo sed -i 's/MyUserName/'$UNAME'/g' /etc/init.d/qbittorrent-nox-daemon || { echo -e $RED'Replacing username in default failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's/XXXX/8086/g' /etc/init.d/qbittorrent-nox-daemon || { echo -e $RED'Replacing port in default failed.'$ENDCOLOR ; exit 1; }

echo 
sleep 1

echo -e $YELLOW"--->Enabling autostart during boot..."$ENDCOLOR
sudo update-rc.d qbittorrent-nox-daemon defaults >/dev/null 2>&1

echo 
sleep 1

echo -e $YELLOW"--->Starting qBittorrent..."$ENDCOLOR
sudo service qbittorrent-nox-daemon start >/dev/null 2>&1

sleep 1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'qBittorrent should start within 10-20 seconds.'
echo -e 'If not you can start it using '$CYAN'sudo service qbittorrent-nox-daemon start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8086'$ENDCOLOR' in your browser. The default username and password are admin and adminadmin, respectively'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC qBittorrent Install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
exit 0
