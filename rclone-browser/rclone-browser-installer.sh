#!/bin/bash

# Script Name: AtoMiC Rclone Browser Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)


source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh"

if [[ -n $APPREPOSITORYLINK ]]; then
    source "$SCRIPTPATH/inc/app-repository-add.sh"
    echo
    source "$SCRIPTPATH/rclone/rclone-constants.sh"
    curl https://rclone.org/install.sh | sudo bash
    source "$SCRIPTPATH/inc/app-folders-create.sh"
    source "$SCRIPTPATH/inc/app-set-permissions.sh"
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    source "$SCRIPTPATH/rclone-browser/rclone-browser-constants.sh"
    source "$SCRIPTPATH/inc/pkgupdate.sh"
    source "$SCRIPTPATH/inc/app-install.sh"
    source "$SCRIPTPATH/inc/app-install-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
else
    echo -e "${RED}Linux OS Version $CYAN$CODENAME$RED is not supported.$ENDCOLOR"
fi
source "$SCRIPTPATH/inc/exit.sh"
