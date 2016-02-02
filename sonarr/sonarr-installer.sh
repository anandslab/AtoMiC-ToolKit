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

source $SCRIPTPATH/sonarr/sonarr-constants.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Installer Script'$ENDCOLOR

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

source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-move-previous.sh
source $SCRIPTPATH/inc/app-install-deps.sh
source $SCRIPTPATH/inc/app-install.sh

echo 
sleep 1

echo -e $YELLOW'--->Setting up autostart...'$ENDCOLOR
sudo cp $SCRIPTPATH/sonarr/sonarr-init /etc/init.d/nzbdrone || { echo -e $RED'Init file not copied.'$ENDCOLOR ; exit 1; }
sudo sed -i 's@RUN_AS=USERNAME@RUN_AS='"$UNAME"'@g' /etc/init.d/nzbdrone  || { echo -e $RED'Replacing username in init failed.'$ENDCOLOR ; exit 1; }
source $SCRIPTPATH/inc/app-init-add.sh

echo 
sleep 1

echo -e $YELLOW"--->Creating folders..."$ENDCOLOR
if [ ! -d "/var/run/nzbdrone" ]; then
	sudo mkdir /var/run/nzbdrone
fi

source $SCRIPTPATH/inc/app-set-permissions.sh
source $SCRIPTPATH/inc/app-start.sh
source $SCRIPTPATH/inc/app-install-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
