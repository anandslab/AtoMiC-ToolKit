#!/bin/bash
# Script Name: AtoMiC Mono Uninstaller
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e $GREEN"AtoMiC $APPTITLE Uninstaller Script"$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/app-stop.sh
source $SCRIPTPATH/inc/app-uninstall.sh
source $SCRIPTPATH/inc/app-repository-remove.sh 
source $SCRIPTPATH/inc/app-uninstall-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
echo
echo -e $GREEN"AtoMiC $APPTITLE Uninstall Complete"$ENDCOLOR
