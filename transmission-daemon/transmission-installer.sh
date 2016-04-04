#!/bin/bash
# Script Name: AtoMiC Transmission WebUI Installer
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

source $SCRIPTPATH/transmission-daemon/transmission-constants.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

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

source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-move-previous.sh
source $SCRIPTPATH/inc/app-install-deps.sh
source $SCRIPTPATH/inc/app-install.sh

source $SCRIPTPATH/inc/app-stop.sh
sleep 2
sudo service transmission-daemon stop > /dev/null 2>&1
sleep 2
sudo killall transmission-daemon > /dev/null 2>&1

source $SCRIPTPATH/inc/app-folders-create.sh

echo
sleep 1

echo -e $YELLOW"--->Creating init and default files..."$ENDCOLOR
sudo cp $SCRIPTPATH/$APPNAME/transmission-default /etc/default/$APPNAME
sudo cp $SCRIPTPATH/$APPNAME/transmission-init /etc/init.d/$APPNAME
sudo sed -i 's@USER_NAME@'"$UNAME"'@g' /etc/init.d/transmission-daemon  || { echo -e $RED'Replacing daemon username in init failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's@/var/lib/transmission-daemon/info@'"$APPPATH"'@g' /etc/default/transmission-daemon  || { echo -e $RED'Replacing config directory in defualt failed.'$ENDCOLOR ; exit 1; }

sleep 1
echo

echo -e $YELLOW"--->Copying settings file and setting permissions..."$ENDCOLOR
cp $SCRIPTPATH/$APPNAME/transmission-initial-settings.json $APPSETTINGS || { echo -e $RED'Initial settings move failed.'$ENDCOLOR ; exit 1; }
sed -i 's@USER_NAME@'"$UNAME"'@g' $APPSETTINGS || { echo -e $RED'Replacing username in settings-json failed.'$ENDCOLOR ; exit 1; }
sudo usermod -a -G debian-transmission $UNAME  || { echo -e $RED'Adding debian-transmission group to user failed.'$ENDCOLOR ; exit 1; }
sudo rm /var/lib/transmission-daemon/info/settings.json > /dev/null 2>&1
sudo ln -s $APPSETTINGS /var/lib/transmission-daemon/info/settings.json || { echo -e $RED'Creating settings.json symbolic link failed.'$ENDCOLOR ; exit 1; }

echo
sleep 1

echo -e $YELLOW"--->Setting setuid and setgid..."$ENDCOLOR
sudo sed -i 's@setuid debian-transmission@setuid '"$UNAME"'@g' /etc/init.d/transmission-daemon || { echo -e $RED'Replacing setuid failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's@setgid debian-transmission@setgid '"$UGROUP"'@g' /etc/init.d/transmission-daemon || { echo -e $RED'Replacing setgid failed.'$ENDCOLOR ; exit 1; }

source $SCRIPTPATH/inc/app-init-add.sh

source $SCRIPTPATH/inc/app-set-permissions.sh
source $SCRIPTPATH/inc/app-start.sh
kill -s SIGHUP `pidof transmission-daemon` >/dev/null 2>&1
source $SCRIPTPATH/inc/app-install-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
