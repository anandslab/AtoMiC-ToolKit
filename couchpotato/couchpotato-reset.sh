#!/bin/bash
# Script Name: AtoMiC CouchPotato Password Reset
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

source $SCRIPTPATH/couchpotato/couchpotato-constants.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Password Reset Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/app-stop.sh
source $SCRIPTPATH/inc/app-folder-check.sh

PASSSEARCH='password = '
source $SCRIPTPATH/inc/app-password-search.sh

echo 
sleep 1

echo -e $YELLOW'Setting temporary '$APPTITLE' WebUI password...'$ENDCOLOR
# New password = atomic
NEWPASS='23d33884d600e542d097cd3933df2ae4'
sed -i 's@'"$PASSSEARCH$UIPASS"'@'"$PASSSEARCH$NEWPASS"'@g' $APPSETTINGS || { echo -e $RED'Setting temporary password failed.'$ENDCOLOR ; exit 1; }
echo -e 'Temporary password set to: '$CYAN'atomic'$ENDCOLOR

source $SCRIPTPATH/inc/app-start.sh
source $SCRIPTPATH/inc/app-reset-confirmation.sh
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh