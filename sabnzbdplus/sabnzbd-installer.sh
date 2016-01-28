#!/bin/bash
# Script Name: AtoMiC SABnzbd Installer
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

source $SCRIPTPATH/sabnzbdplus/sabnzbd-constants.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo
sleep 1

echo -e $YELLOW"--->Adding '$APPTITLE' repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep jcfp)
if [ "$GREPOUT" == "" ]; then
    sudo add-apt-repository -y ppa:jcfp/ppa
else
    echo $APPTITLE' pPA repository already exists...'
fi

source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-move-previous.sh
source $SCRIPTPATH/inc/app-install.sh

echo 
sleep 1

echo -e $YELLOW"--->Making some configuration changes..."$ENDCOLOR
sudo sed -i 's@USER=@USER='"$UNAME"'@g' /etc/default/sabnzbdplus  || { echo -e $RED'Replacing username in default failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's@HOST=@HOST=0.0.0.0@g' /etc/default/sabnzbdplus  || { echo -e $RED'Replacing host in default failed.'$ENDCOLOR ; exit 1; }
#sudo sed -i 's@PORT=@PORT=8080@g' /etc/default/sabnzbdplus || { echo -e $RED'Replacing port in default failed.'$ENDCOLOR ; exit 1; }

echo 
sleep 1

source $SCRIPTPATH/inc/app-init-add.sh
source $SCRIPTPATH/inc/app-set-permissions.sh
source $SCRIPTPATH/inc/app-start.sh
source $SCRIPTPATH/inc/app-install-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
