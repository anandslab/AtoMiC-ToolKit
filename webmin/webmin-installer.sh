#!/bin/bash
# Script Name: AtoMiC Webmin Installer
# Author: carrigan98
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $1 != *"setup.sh"* ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi

source $2/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN'AtoMiC Webmin Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW'--->Downloading latest Webmin...'$ENDCOLOR
sudo mkdir -p /tmp/webmin
cd /tmp/webmin 
sudo wget "http://sourceforge.net/projects/webadmin/files/webmin/"$APPVERSION"/webmin_"$APPVERSION"_all.deb"

echo
sleep 1

echo -e $YELLOW'--->Configuring Webmin Install...'$ENDCOLOR
sudo dpkg --force-depends -i webmin_*.deb
sudo apt-get install -f -y

echo
sleep 1

echo -e $YELLOW'--->Removing temporary Webmin Files...'$ENDCOLOR
sudo rm -rf /tmp/webmin

echo
sleep 1

echo -e 'Starting Webmin...'
sudo /etc/init.d/webmin start >/dev/null 2>&1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'Webmin should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/webmin start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:10000'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
