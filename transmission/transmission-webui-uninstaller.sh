#!/bin/bash
# Script Name: AtoMiC Transmission Uninstaller
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
echo -e $GREEN'AtoMiC Transmission Uninstaller Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->Transmission uninstallation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to uninstall any relevant files/packages.'
echo -e '5. Best used to uninstall Transmission installed using AtoMiC ToolKit or '$CYAN'www.htpcBeginner.com'$ENDCOLOR' guides.'

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

echo -n 'Type the username of the user you installed SickBeard as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
  echo -e $RED'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo bash setup.sh
	exit 0
fi

echo
sleep 1

echo -e $YELLOW'--->Stopping Transmission...'$ENDCOLOR
sudo service transmission-daemon stop >/dev/null 2>&1
sudo killall transmission-daemon >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Uninstalling Transmission...'$ENDCOLOR
sudo apt-get -y remove transmission-cli transmission-common transmission-daemon

echo
sleep 1

echo -e $YELLOW'--->Removing Transmission Autostart scripts...'$ENDCOLOR
sudo update-rc.d -f transmission-daemon remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
sudo rm /etc/init.d/transmission-daemon || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }

echo
sleep 1

read -p 'Do you want to keep Transmission configuration files in case you want to reinstall later? Type y/Y to keep files or any other key to delete files, and press [ENTER] : '
FILEDEL=${REPLY,,}

if [ "$FILEDEL" != "y" ] 
then
	echo
	echo -e $YELLOW'--->Deleting Transmission files from '$CYAN'/home/'$UNAME'/.config/transmission'$YELLOW'...'$ENDCOLOR
	sudo rm -r /home/$UNAME/.config/transmission >/dev/null 2>&1
else
	echo
	echo -e $YELLOW'--->Keeping Transmission files in '$CYAN'/home/'$UNAME'/.config/transmission'$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

read -p 'You may keep Transmission downloads folder that has completed and incomplete downloads. Do you want to keep the folders? Type y/Y and press [ENTER]: '
FILEDELE=${REPLY,,}

if [ "$FILEDELE" != "y" ] 
then
	echo
	echo -e $YELLOW'--->Deleting Transmission downloads folder '$CYAN'/home/'$UNAME'/Downloads/transmission'$YELLOW'...'$ENDCOLOR
	sudo rm -r /home/$UNAME/Downloads/transmission >/dev/null 2>&1
else
	echo
	echo -e $YELLOW'--->Keeping Transmission downloads folder '$CYAN'/home/'$UNAME'/Downloads/transmission'$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

echo -e $GREEN'--->All done.'$ENDCOLOR
echo -e 'Transmission Uninstalled.'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC Transmission Uninstall script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo bash setup.sh
exit 0
