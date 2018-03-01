#!/bin/bash


# Script Name: AtoMiC Wtcher Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"

#If we find the old version move
if [[ -d /opt/watcher ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    APPPATH='/opt/watcher'
    source "$SCRIPTPATH/inc/app-file-del.sh"
    source "$SCRIPTPATH/watcher/watcher-constants.sh"
fi

source "$SCRIPTPATH/inc/app-move-previous.sh"
source "$SCRIPTPATH/utils/python/python-installer.sh" 'python3'
source "$SCRIPTPATH/watcher/watcher-constants.sh"
source "$SCRIPTPATH/inc/app-install-pips.sh" "pip3"
source "$SCRIPTPATH/inc/app-git-download.sh"
source "$SCRIPTPATH/inc/app-autostart-configure.sh"
source "$SCRIPTPATH/inc/app-set-permissions.sh"
source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
