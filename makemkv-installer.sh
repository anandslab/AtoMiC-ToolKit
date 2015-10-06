#!/bin/bash
# Script Name: AtoMiC MakeMKV Installer
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
APPVERSION="1.9.7"

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
echo -e $GREEN'AtoMiC MakeMKV Installer Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->MakeMKV installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure MakeMKV.'
echo -e '5. Best used on a clean system (with no previous MakeMKV install) or after complete removal of previous MakeMKV installation.'

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

echo -n 'Type the username of the user you want to run MakeMKV as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
	echo -e 'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'
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
sudo apt-get -y install \
    build-essential \
    pkg-config \
    libc6-dev \
    libssl-dev \
    libexpat1-dev \
    libavcodec-dev \
    libgl1-mesa-dev \
    libqt4-dev

echo
sleep 1

echo -e $YELLOW'--->Downloading latest MakeMKV...'$ENDCOLOR
sudo mkdir -p /tmp/makemkv
cd /tmp/makemkv
sudo wget http://www.makemkv.com/download/makemkv-oss-$APPVERSION.tar.gz
sudo tar -xf makemkv-oss-$APPVERSION.tar.gz
sudo wget http://www.makemkv.com/download/makemkv-bin-$APPVERSION.tar.gz
sudo tar -xf makemkv-bin-$APPVERSION.tar.gz

echo
sleep 1

echo -e $YELLOW'--->Configuring MakeMKV Install...'$ENDCOLOR
cd /tmp/makemkv/makemkv-oss-$APPVERSION
./configure
make
sudo make install

cd /tmp/makemkv/makemkv-bin-$APPVERSION
clear
echo -e $YELLOW'When the MakeMKV License appears, type "q". Afterwards, type "yes" to agree and press [Enter]'$ENDCOLOR
echo
pause 'Press [Enter] key to continue...'
make
sudo make install

echo
sleep 1

echo -e $YELLOW'--->Removing temporary MakeMKV Files...'$ENDCOLOR
sudo rm -rf /tmp/makemkv

echo
sleep 1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'makemkvcon should be located here '$CYAN'/usr/bin/makemkvcon'$ENDCOLOR
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC MakeMKV Install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'
cd $SCRIPTPATH
sudo ./setup.sh
exit 0