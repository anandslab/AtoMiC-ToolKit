#!/bin/bash
# Script Name: AtoMiC Transmission WebUI Installer
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
echo -e $GREEN'AtoMiC Transmission WebUI Installer Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->Transmission installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure Transmission.'
echo -e '5. Best used on a clean system (with no previous Transmission install) or after complete removal of previous Transmission installation.'
echo -e '6. The script installs only Transmission WebUI and not the desktop GUI.'

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

echo -n 'Type the username of the user you want to run Transmission as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
	echo -e $RED'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo ./setup.sh
fi
UGROUP=($(id -gn $UNAME))

echo

echo -e $YELLOW'--->Refreshing packages list...'$ENDCOLOR
sudo apt-get update

echo
sleep 1

echo -e $YELLOW"--->Installing prerequisites..."$ENDCOLOR
sudo apt-get -y install python-software-properties

echo
sleep 1

echo -e $YELLOW"--->Adding Transmission repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep transmissionbt)
if [ "$GREPOUT" == "" ]; then
    sudo add-apt-repository -y ppa:transmissionbt/ppa
else
    echo "Transmission PPA repository already exists..."
fi

echo
sleep 1

echo -e $YELLOW"--->Refreshing packages list again..."$ENDCOLOR
sudo apt-get update

echo
sleep 1

echo -e $YELLOW"--->Installing Transmission commandline, and web interface..."$ENDCOLOR
sudo apt-get -y install transmission-cli transmission-common transmission-daemon

echo 
sleep 1

echo -e $YELLOW"--->Stopping Transmission temporarily..."$ENDCOLOR
sudo /etc/init.d/transmission-daemon stop > /dev/null 2>&1 
sleep 2
sudo service transmission-daemon stop > /dev/null 2>&1 
sleep 2
sudo killall transmission-daemon > /dev/null 2>&1 
sleep 2

echo 
sleep 1

echo -e $YELLOW"--->Creating download directories..."$ENDCOLOR
if [ ! -d "/home/$UNAME/.config" ]; then
	mkdir /home/$UNAME/.config
fi
if [ ! -d "/home/$UNAME/.config/transmission" ]; then
	mkdir /home/$UNAME/.config/transmission
fi
if [ ! -d "/home/$UNAME/Downloads" ]; then
	mkdir /home/$UNAME/Downloads
fi
if [ ! -d "/home/$UNAME/Downloads/transmission" ]; then
	mkdir /home/$UNAME/Downloads/transmission
fi
if [ ! -d "/home/$UNAME/Downloads/transmission/incomplete" ]; then
	mkdir /home/$UNAME/Downloads/transmission/incomplete
fi

echo -e 'Following directories created...'
echo -e $CYAN'/home/'$UNAME'/.config/transmission'$ENDCOLOR ' - Transmission Settings'
echo -e $CYAN'/home/'$UNAME'/Downloads'$ENDCOLOR ' - Watched Folder'
echo -e $CYAN'/home/'$UNAME'/Downloads/transmission'$ENDCOLOR ' - Completed Downloads'
echo -e $CYAN'/home/'$UNAME'/Downloads/transmission/incomplete'$ENDCOLOR ' - Incomplete Downloads'

sleep 1
echo 

echo -e $YELLOW"--->Making some configuration changes..."$ENDCOLOR
sudo sed -i 's/USER=debian-transmission/USER='$UNAME'/g' /etc/init.d/transmission-daemon  || { echo -e $RED'Replacing daemon username in init failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's|/var/lib/transmission-daemon/info|/home/'$UNAME'/.config/transmission|g' /etc/default/transmission-daemon  || { echo -e $RED'Replacing config directory in defualt failed.'$ENDCOLOR ; exit 1; }

sleep 1
echo 

echo -e $YELLOW"--->Copying settings file and setting permissions..."$ENDCOLOR
cp $SCRIPTPATH/transmission-initial-settings.json /home/$UNAME/.config/transmission/settings.json || { echo -e $RED'Initial settings move failed.'$ENDCOLOR ; exit 1; }
cd /home/$UNAME/.config/transmission
sudo usermod -a -G debian-transmission $UNAME  || { echo -e $RED'Adding debian-transmission group to user failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:debian-transmission settings.json  || { echo -e $RED'Chown settings.json failed'$ENDCOLOR ; exit 1; }
sudo rm /var/lib/transmission-daemon/info/settings.json > /dev/null 2>&1
sudo ln -s /home/$UNAME/.config/transmission/settings.json /var/lib/transmission-daemon/info/settings.json || { echo -e $RED'Creating settings.json symbolic link failed.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME: /home/$UNAME/Downloads/transmission
sudo chown -R $UNAME:debian-transmission /home/$UNAME/.config/transmission
sudo chmod -R 775 /home/$UNAME/Downloads/transmission
sudo chmod -R 775 /home/$UNAME/.config/transmission
sudo chmod -R 775 /var/lib/transmission-daemon
sudo chmod g+s /home/$UNAME/.config/transmission
sudo chmod g+s /home/$UNAME/Downloads/transmission

echo 
sleep 1

echo -e $YELLOW"--->Setting up Transmission User, WebUI User and Password..."$ENDCOLOR
sed -i 's|USER_NAME|'$UNAME'|g' /home/$UNAME/.config/transmission/settings.json || { echo -e $RED'Replacing username in settings-json failed.'$ENDCOLOR ; exit 1; }

echo -n 'Set a username for Transmission WebUI and press [ENTER]: '
read TUNAME
if [ -z "$TUNAME" ]
   then
   echo -e '    No username entered so setting default username: '$CYAN'transmission'$ENDCOLOR
   TUNAME=transmission
   else 
   echo -e '    WebUI username set to:'$CYAN $TUNAME $ENDCOLOR
fi
sed -i 's|WEBUI_USERNAME|'$TUNAME'|g' /home/$UNAME/.config/transmission/settings.json || { echo -e $RED'Setting new username in settings.json failed.'$ENDCOLOR ; exit 1; }

echo -n 'Set a password for Transmission WebUI and press [ENTER]: '
read TPASS
if [ -z "$TPASS" ]
   then
   echo -e '    No password entered so setting default password: '$CYAN'transmission'$ENDCOLOR
   TPASS=transmission
   else 
   echo -e '    WebUI password set to: '$CYAN$TPASS$ENDCOLOR
fi
sed -i 's|WEBUI_PASSWORD|'$TPASS'|g' /home/$UNAME/.config/transmission/settings.json || { echo -e $RED'Setting new password in settings.json failed.'$ENDCOLOR ; exit 1; }
sed -i 's|USER_NAME|'$UNAME'|g' /home/$UNAME/.config/transmission/settings.json || { echo -e $RED'Replacing username in settings-json failed.'$ENDCOLOR ; exit 1; }

echo 
sleep 1

echo -e $YELLOW"--->Setting setuid and setgid..."$ENDCOLOR
sudo sed -i 's/setuid debian-transmission/setuid '$UNAME'/g' /etc/init/transmission-daemon.conf  || { echo -e $RED'Replacing setuid failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's/setgid debian-transmission/setgid '$UGROUP'/g' /etc/init/transmission-daemon.conf  || { echo -e $RED'Replacing setgid failed.'$ENDCOLOR ; exit 1; }

echo 
sleep 1

echo -e $YELLOW"--->Enabling autostart during boot..."$ENDCOLOR
sudo update-rc.d transmission-daemon defaults

echo 
sleep 1

echo -e $YELLOW"--->Starting Transmission..."$ENDCOLOR
sudo /etc/init.d/transmission-daemon start >/dev/null 2>&1
kill -s SIGHUP `pidof transmission-daemon` >/dev/null 2>&1

echo 
sleep 1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e $YELLOW'--->Please read the instructions below clearly. When you are done reboot your system using '$RED'sudo reboot'$YELLOW' command.'$ENDCOLOR
echo -e 'Note down the the Transmission directories created above. Transmission should autostart on reboot. If not run '$CYAN'sudo /etc/init.d/transmission-daemon start'$ENDCOLOR'. Then open '$CYAN'http://localhost:9091'$ENDCOLOR' in your browser.'
echo -e 'If you everything works, you may delete'$CYAN $SCRIPTPATH $ENDCOLOR'folder and reboot.'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC Sick Beard install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
