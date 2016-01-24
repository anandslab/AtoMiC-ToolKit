#!/bin/bash
# Script Name: AtoMiC Sonarr / NzbDrone Installer
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

echo -e $GREEN'AtoMiC Sonarr / NzbDrone Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

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

source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW"--->Installing Mono..."$ENDCOLOR
sudo apt-get -y install mono-complete nzbdrone

echo 
sleep 1

echo -e $YELLOW'--->Creating Sonarr AutoStart script...'$ENDCOLOR
sudo cp sonarr-init /etc/init.d/nzbdrone || { echo $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:$UGROUP /etc/init.d/nzbdrone
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
service nzbdrone start >/dev/null 2>&1

sleep 1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'Sonarr should start within 10-20 seconds.'
echo -e 'If not you can start it using '$CYAN'sudo service nzbdrone start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8989'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
