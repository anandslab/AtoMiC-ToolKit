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

source $SCRIPTPATH/webmin/webmin-constants.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-install-deps.sh

echo -e $YELLOW"--->Adding '$APPTITLE' Repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep webmin)
if [ "$GREPOUT" == "" ]; then
	wget -P $SCRIPTPATH/tmp/ http://www.webmin.com/jcameron-key.asc  || { echo -e $RED'Error! Downloading key failed.'$ENDCOLOR ; }
	sudo apt-key add $SCRIPTPATH/tmp/jcameron-key.asc  || { echo -e $RED'Error! Adding key failed.'$ENDCOLOR ; }
	echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
    echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
else
    echo $APPTITLE'Webmin repository repository already exists...'
fi

source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-install.sh
source $SCRIPTPATH/inc/app-start.sh
source $SCRIPTPATH/inc/app-install-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
