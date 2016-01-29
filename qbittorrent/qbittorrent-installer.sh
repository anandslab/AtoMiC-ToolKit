#!/bin/bash
# Script Name: AtoMiC qBittorrent Installer
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
source $SCRIPTPATH/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

source $SCRIPTPATH/qbittorrent/qbittorrent-constants.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo
sleep 1

#START WORKING HERE. SEE IF THIS CAN BE SOURCED
echo -e $YELLOW"--->Adding '$APPTITLE' repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep qbittorrent)
if [ "$GREPOUT" == "" ]; then
    sudo add-apt-repository -y $APPREPO
else
    echo "'$APPTITLE' PPA repository already exists..."
fi

echo
sleep 1

source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW"--->Installing qBittorrent..."$ENDCOLOR
sudo apt-get -y install qbittorrent-nox

echo
sleep 1

echo -e $YELLOW'--->Copying init and config file...'$ENDCOLOR
sudo cp $SCRIPTPATH/qbittorrent/qbittorrent-nox-daemon /etc/init.d/ || { echo -e $RED'Init file not copied.'$ENDCOLOR ; exit 1; }
sudo chmod 755 /etc/init.d/qbittorrent-nox-daemon

if [ ! -d "/home/$UNAME/.config" ]; then
    mkdir /home/$UNAME/.config
fi
if [ ! -d "/home/$UNAME/.config/qBittorrent" ]; then
	echo -e 'No previous qBittorrent configuration folder found'
	mkdir /home/$UNAME/.config/qBittorrent
else
	mv /home/$UNAME/.config/qBittorrent /home/$UNAME/.config/qBittorrent_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing qBittorrent configurations were moved to '$CYAN'/home/$UNAME/.config/qBittorrent_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
	mkdir /home/$UNAME/.config/qBittorrent
fi
if [ ! -f "/home/$UNAME/.config/qBittorrent/qBittorrent.conf" ];
then
	sudo cp $SCRIPTPATH/qbittorrent/qBittorrent.conf /home/$UNAME/.config/qBittorrent/ || { echo -e $RED'Conf file not copied.'$ENDCOLOR ; exit 1; }
else 
	echo -e 'Using the existing qBittorrent.conf file.'
fi
sudo chown -R $UNAME:$UGROUP /home/$UNAME/.config/qBittorrent

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

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
