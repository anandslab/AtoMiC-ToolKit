#!/bin/bash
# Script Name: AtoMiC Deluge WebUI Installer
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
echo -e $GREEN'AtoMiC Deluge WebUI Installer Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->Deluge installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure Deluge.'
echo -e '5. Best used on a clean system (with no previous Deluge install) or after complete removal of previous Deluge installation.'
echo -e '6. The script installs only Deluge WebUI and not the desktop GUI.'

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

echo -n 'Type the username of the user you want to run Deluge as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
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
sudo apt-get update

echo
sleep 1

echo -e $YELLOW"--->Installing prerequisites..."$ENDCOLOR
sudo apt-get -y install python-software-properties

echo
sleep 1

echo -e $YELLOW"--->Adding Deluge repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep deluge-team)
if [ "$GREPOUT" == "" ]; then
    sudo add-apt-repository -y ppa:deluge-team/ppa
    echo
    sleep 1
    echo -e $YELLOW"--->Refreshing packages list again..."$ENDCOLOR
    sudo apt-get update
else
    echo "Deluge PPA repository already exists..."
fi

echo
sleep 1

echo -e $YELLOW"--->Installing Deluge commandline, and web interface..."$ENDCOLOR
sudo apt-get -y install \
    deluge-console \
    deluge-webui \
    deluged

echo 
sleep 1

echo -e $YELLOW'--->Checking for previous versions of Deluge...'$ENDCOLOR
sleep 1
sudo /etc/init.d/deluge-daemon stop >/dev/null 2>&1
echo -e 'Any running Deluge processes stopped'
sleep 1
sudo update-rc.d -f deluge-daemon remove >/dev/null 2>&1
sudo rm /etc/init.d/deluge-daemon >/dev/null 2>&1
sudo rm /etc/default/deluge-daemon >/dev/null 2>&1
echo -e 'Any existing Deluge init scripts removed'
sleep 1
sudo update-rc.d -f deluge-daemon remove >/dev/null 2>&1
if [ -d "/home/$UNAME/.config/deluge" ]; then
	mv /home/$UNAME/.config/deluge /home/$UNAME/.config/deluge_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing Deluge files were moved to '$CYAN'/home/'$UNAME'/.config/deluge_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous Deluge configuration files found'
fi

echo 
sleep 1

echo -e $YELLOW"--->Creating initial configuration files..."$ENDCOLOR
/usr/bin/deluged > /dev/null 2>&1
sleep 2
/usr/bin/deluge-web --fork > /dev/null 2>&1
sleep 2

echo 
sleep 1

echo -e $YELLOW"--->Stopping Deluge temporarily..."$ENDCOLOR
sudo /etc/init.d/deluged stop > /dev/null 2>&1 
sleep 2
sudo service deluged stop > /dev/null 2>&1 
sleep 2
sudo killall deluged > /dev/null 2>&1 
sleep 2
sudo /etc/init.d/deluge-web stop > /dev/null 2>&1 
sleep 2
sudo service deluge-web stop > /dev/null 2>&1
sleep 2
sudo killall deluge-web > /dev/null 2>&1 
sleep 2

echo 
sleep 1

echo -e $YELLOW"--->Creating download directories..."$ENDCOLOR
if [ ! -d "/home/$UNAME/.config" ]; then
	mkdir /home/$UNAME/.config
fi
if [ ! -d "/home/$UNAME/.config/deluge" ]; then
	mkdir /home/$UNAME/.config/deluge
fi
if [ ! -d "/home/$UNAME/Downloads" ]; then
	mkdir /home/$UNAME/Downloads
fi
if [ ! -d "/home/$UNAME/Downloads/deluge" ]; then
	mkdir /home/$UNAME/Downloads/deluge
fi
if [ ! -d "/home/$UNAME/Downloads/deluge/incomplete" ]; then
	mkdir /home/$UNAME/Downloads/deluge/incomplete
fi

echo -e 'Following directories created...'
echo -e $CYAN'/home/'$UNAME'/.config/deluge'$ENDCOLOR ' - Deluge Settings'
echo -e $CYAN'/home/'$UNAME'/Downloads'$ENDCOLOR ' - Watched Folder'
echo -e $CYAN'/home/'$UNAME'/Downloads/deluge'$ENDCOLOR ' - Completed Downloads'
echo -e $CYAN'/home/'$UNAME'/Downloads/deluge/incomplete'$ENDCOLOR ' - Incomplete Downloads'

sleep 1
echo 

echo -e $YELLOW"--->Creating deluge user..."$ENDCOLOR
sudo adduser --system --group --home /var/lib/deluge deluge

echo -e $YELLOW"--->Setting permissions..."$ENDCOLOR
cd /home/$UNAME/.config/deluge
sudo usermod -a -G deluge $UNAME  || { echo -e $RED'Adding deluge group to user failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:deluge core.conf  || { echo -e $RED'Chown core.conf failed'$ENDCOLOR ; exit 1; }
#sudo rm /var/lib/transmission-daemon/info/settings.json > /dev/null 2>&1
#sudo ln -s /home/$UNAME/.config/transmission/settings.json /var/lib/transmission-daemon/info/settings.json || { echo -e $RED'Creating settings.json symbolic link failed.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME: /home/$UNAME/Downloads/deluge
sudo chown -R $UNAME:deluge /home/$UNAME/.config/deluge
sudo chmod -R 775 /home/$UNAME/Downloads/deluge
sudo chmod -R 775 /home/$UNAME/.config/deluge
sudo chmod g+s /home/$UNAME/.config/deluge
sudo chmod g+s /home/$UNAME/Downloads/deluge

echo 
sleep 1

echo -e $YELLOW"--->Setting up Deluge WebUI User and Password..."$ENDCOLOR

echo -n 'Set a username for Deluge WebUI and press [ENTER]: '
read DUNAME
if [ -z "$DUNAME" ]
   then
   echo -e '    No username entered so setting default username: '$CYAN'deluge'$ENDCOLOR
   DUNAME=deluge
   else 
   echo -e '    WebUI username set to:'$CYAN $DUNAME $ENDCOLOR
fi

echo -n 'Set a password for Deluge WebUI and press [ENTER]: '
read DPASS
if [ -z "$DPASS" ]
   then
   echo -e '    No password entered so setting default password: '$CYAN'deluge'$ENDCOLOR
   DPASS=deluge
   else 
   echo -e '    WebUI password set to: '$CYAN$DPASS$ENDCOLOR
fi

echo $DUNAME":"$DPASS":10" >> /home/$UNAME/.config/deluge/auth || { echo -e $RED'Setting username and password in auth failed.'$ENDCOLOR ; exit 1; }
echo "deluge:deluge:10" >> /home/$UNAME/.config/deluge/auth

echo 
sleep 1

echo -e $YELLOW"--->Enabling auto-start during boot..."$ENDCOLOR
cd $SCRIPTPATH
echo "# COPY THIS FILE TO /etc/default/deluge-daemon" >> deluge_default || { echo -e $RED'Could not create default file.'$ENDCOLOR ; exit 1; }
echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run Deluge...'
echo 'DELUGED_USER="'$UNAME'"' >> deluge_default
echo 'RUN_AT_STARTUP="YES"' >> deluge_default
sudo mv deluge_default /etc/default/deluge-daemon
sudo cp $SCRIPTPATH/deluge-init /etc/init.d/deluge-daemon || { echo $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME: /etc/init.d/deluge-daemon
sudo chmod +x /etc/init.d/deluge-daemon
sudo update-rc.d deluge-daemon defaults

echo 
sleep 1

echo -e $YELLOW'--->Creating Run Directories...'$ENDCOLOR
sudo mkdir -p /var/run/deluge
sudo chown -R $UNAME: /var/run/deluge > /dev/null 2>&1

echo 
sleep 1

echo -e $YELLOW'--->Creating Log Directories...'$ENDCOLOR
sudo mkdir -p /var/log/deluge
sudo chown $UNAME: /var/log/deluge > /dev/null 2>&1

echo 
sleep 1

echo -e $YELLOW"--->Starting Deluge..."$ENDCOLOR
sudo invoke-rc.d deluge-daemon start > /dev/null 2>&1
/usr/bin/deluge-console "config -s allow_remote True" > /dev/null 2>&1
sudo invoke-rc.d deluge-daemon restart > /dev/null 2>&1
#kill -s SIGHUP `pidof deluge-daemon` > /dev/null 2>&1

echo 
sleep 1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e $YELLOW'--->Please read the instructions below clearly. When you are done reboot your system using '$RED'sudo reboot'$YELLOW' command.'$ENDCOLOR
echo -e 'Note down the the Deluge directories created above. Deluge should autostart on reboot. If not run '$CYAN'sudo /etc/init.d/deluge-daemon start'$ENDCOLOR'. Then open '$CYAN'http://localhost:8112'$ENDCOLOR' in your browser.'
echo -e 'If you everything works, you may delete'$CYAN $SCRIPTPATH $ENDCOLOR'folder and reboot.'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC Deluge WebUI Install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
exit 0