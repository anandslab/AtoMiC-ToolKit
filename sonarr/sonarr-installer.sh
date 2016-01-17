#!/bin/bash
# Script Name: AtoMiC Sonarr / NzbDrone Installer
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
echo -e $GREEN'AtoMiC Sonarr / NzbDrone Installer Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->Sonarr installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure Sonarr.'
echo -e '5. Best used on a clean system (with no previous Sonarr install) or after complete removal of previous Sonarr installation.'

echo

read -p 'Type y/Y and press [ENTER] to AGREE and continue with the installation or any other key to exit: '
RESP=${REPLY,,}

if [ "$RESP" != "y" ] 
then
	echo -e $RED'So you chickened out. May be you will try again later.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo bash setup.sh
	exit 0
fi

echo 

echo -n 'Type the username of the user you want to run Sonarr as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
	echo -e $RED'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo bash setup.sh
	exit 0
fi
UGROUP=($(id -gn $UNAME))

echo
sleep 1

echo -e $YELLOW"--->Adding Mono repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep monodevelop)
if [ "$GREPOUT" == "" ]; then
    sudo add-apt-repository -y ppa:ermshiperete/monodevelop
else
    echo "Mono PPA repository already exists..."
fi

echo
sleep 1

echo -e $YELLOW"--->Adding Sonarr repository..."$ENDCOLOR

if grep -Fxq "deb http://update.nzbdrone.com/repos/apt/debian master main" /etc/apt/sources.list
then
    echo "Sonarr repository already exists..."
else
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
	echo "deb http://update.nzbdrone.com/repos/apt/debian master main" | sudo tee -a /etc/apt/sources.list
fi

echo
sleep 1

echo -e $YELLOW"--->Refreshing packages list..."$ENDCOLOR
sudo apt-get update

echo
sleep 1

echo -e $YELLOW"--->Installing Mono..."$ENDCOLOR
sudo apt-get -y install mono-complete nzbdrone

echo 
sleep 1

echo -e $YELLOW'--->Creating Sonarr AutoStart script...'$ENDCOLOR
sudo cp sonarr-init /etc/init.d/nzbdrone || { echo $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME: /etc/init.d/nzbdrone
sudo chmod +x /etc/init.d/nzbdrone
if [ ! -d "/var/run/nzbdrone" ]; then
	sudo mkdir /var/run/nzbdrone
fi

echo 
sleep 1

echo -e $YELLOW"--->Making some configuration changes..."$ENDCOLOR
sudo sed -i 's/RUN_AS=USERNAME/RUN_AS='$UNAME'/g' /etc/init.d/nzbdrone  || { echo -e $RED'Replacing Sonarr username in init failed.'$ENDCOLOR ; exit 1; }

echo 
sleep 1

echo -e $YELLOW"--->Enabling autostart during boot..."$ENDCOLOR
sudo update-rc.d nzbdrone defaults

echo 
sleep 1

echo -e $YELLOW"--->Starting Sonarr..."$ENDCOLOR
sudo service nzbdrone start >/dev/null 2>&1

sleep 1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'Sonarr should start within 10-20 seconds.'
echo -e 'If not you can start it using '$CYAN'sudo service nzbdrone start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8989'$ENDCOLOR' in your browser.'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC Sonarr Install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo bash setup.sh
exit 0
