#!/bin/bash
# Script Name: AtoMiC Lazy Librarian Access change
# Author: TommyE123
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

source $SCRIPTPATH/lazylibrarian/lazylibrarian-constants.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Access Fix'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

if [ ! -f $APPSETTINGS ]; then
	source $SCRIPTPATH/inc/app-stop.sh
    source $SCRIPTPATH/inc/app-start.sh
fi 

if [ -f $APPSETTINGS ]; then
	echo 
	sleep 2
	echo -e $YELLOW'--->Making lazylibrarian accessible outside localhost...'$ENDCOLOR
	source $SCRIPTPATH/inc/app-stop.sh
	sleep 2
	sudo sed -i 's@http_host = 0.0.0.0@http_host = localhost@g' $APPSETTINGS  || { echo -e $RED'Modifying http_host in config file failed.'$ENDCOLOR; exit 1; }
	sleep 2
	source $SCRIPTPATH/inc/app-start.sh
	sleep 2
	source $SCRIPTPATH/inc/app-install-confirmation.sh
	source $SCRIPTPATH/inc/thankyou.sh
	source $SCRIPTPATH/inc/exit.sh
else
	echo
    echo -e $RED'Unable to find '$APPSETTINGS'. Start '$APPTITLE' manually using '$CYAN'sudo /etc/init.d/'$APPNAME' start'$ENDCOLOR' and verify that '$CYAN$APPSETTINGS$ENDCOLOR' exists.'
    source $SCRIPTPATH/inc/exit.sh
fi