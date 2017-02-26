#!/bin/bash
# Script Name: AtoMiC Plex Media Server Installer
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

echo -e $GREEN"AtoMiC $APPTITLE Installer Script"$ENDCOLOR
echo

source $SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh
source $SCRIPTPATH/inc/app-repository-add.sh
source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh
source $SCRIPTPATH/plexmediaserver/plexmediaserver-constants.sh
source $SCRIPTPATH/inc/app-folders-create.sh
source $SCRIPTPATH/inc/app-autostart-configure.sh
source $SCRIPTPATH/inc/app-install.sh
source $SCRIPTPATH/inc/app-install-confirmation.sh
echo 'Plex should start within a few seconds'
echo -e 'Open '$CYAN'http://localhost:32400/web'$ENDCOLOR' in your browser to continue the setup.'
source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
