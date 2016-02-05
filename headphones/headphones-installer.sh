#!/bin/bash
# Script Name: AtoMiC Headphones Installer
# Author: PREngineer
# Publisher: http://www.htpcbeginner.com
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

source $SCRIPTPATH/headphones/headphones-constants.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-install-deps.sh
source $SCRIPTPATH/inc/app-move-previous.sh
source $SCRIPTPATH/inc/app-git-download.sh

#echo 'HP_OPTS=" --config='$APPPATH'/config.ini"' >> $SCRIPTPATH/tmp/headphones_default
source $SCRIPTPATH/inc/app-create-default.sh

sudo cp $APPPATH/init-scripts/init.ubuntu /etc/init.d/headphones || { echo $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
source $SCRIPTPATH/inc/app-init-add.sh

source $SCRIPTPATH/inc/app-git-stash.sh
source $SCRIPTPATH/inc/app-set-permissions.sh
source $SCRIPTPATH/inc/app-start.sh

source $SCRIPTPATH/inc/app-install-confirmation.sh
echo -e $RED'IMPORTANT: '$YELLOW'If you are unable to access Headphones on a browser, run Access Fix utility.'$ENDCOLOR
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
