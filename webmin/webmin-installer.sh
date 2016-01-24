#!/bin/bash
# Script Name: AtoMiC Webmin Installer
# Author: carrigan98
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

echo -e $GREEN'AtoMiC Webmin Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW"--->Adding Webmin Repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep webmin)
if [ "$GREPOUT" == "" ]; then
	wget -P $SCRIPTPATH/tmp/ http://www.webmin.com/jcameron-key.asc  || { echo -e $RED'Error! Downloading key failed.'$ENDCOLOR ; }
	sudo apt-key add $SCRIPTPATH/tmp/jcameron-key.asc  || { echo -e $RED'Error! Adding key failed.'$ENDCOLOR ; }
	echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
    echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
else
    echo "Webmin repository repository already exists..."
fi

echo
sleep 1

source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW"--->Installing Webmin and relevant packages..."$ENDCOLOR
sudo apt-get -y install webmin

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
