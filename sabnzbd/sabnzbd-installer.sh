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

echo -e $GREEN'AtoMiC SABnzbd Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo
sleep 1

echo -e $YELLOW"--->Adding SABnzbd repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep jcfp)
if [ "$GREPOUT" == "" ]; then
    sudo add-apt-repository -y ppa:jcfp/ppa
else
    echo "SABnzbd PPA repository already exists..."
fi

echo
sleep 1

source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW"--->Installing SABnzbd..."$ENDCOLOR
sudo apt-get -y install sabnzbdplus

echo 
sleep 1

echo -e $YELLOW"--->Making some configuration changes..."$ENDCOLOR
sudo sed -i 's/USER=/USER='$UNAME'/g' /etc/default/sabnzbdplus  || { echo -e $RED'Replacing username in default failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's/HOST=/HOST=0.0.0.0/g' /etc/default/sabnzbdplus  || { echo -e $RED'Replacing host in default failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's/PORT=/PORT=8080/g' /etc/default/sabnzbdplus || { echo -e $RED'Replacing port in default failed.'$ENDCOLOR ; exit 1; }

echo 
sleep 1

echo -e $YELLOW"--->Enabling autostart during boot..."$ENDCOLOR
sudo update-rc.d sabnzbdplus defaults  >/dev/null 2>&1

echo 
sleep 1

echo -e $YELLOW"--->Starting SABnzbd..."$ENDCOLOR
sudo service sabnzbdplus start >/dev/null 2>&1

sleep 1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'SABnzbd should start within 10-20 seconds.'
echo -e 'If not you can start it using '$CYAN'sudo service sabnzbdplus start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8080'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
