#!/bin/bash
# Script Name: AtoMiC Deluge Uninstaller

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Uninstaller Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-uninstall.sh"
source "$SCRIPTPATH/inc/app-uninstall-deps.sh"
source "$SCRIPTPATH/inc/app-file-del.sh"
source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-remove.sh"

source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH//qbittorrent-nox/qbittorrent-nox-constants.sh"

if [[ ! -d '/home/'$UNAME'/.config/qBittorrent' ]]; then
    source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh"
    source "$SCRIPTPATH/inc/app-repository-remove.sh"
fi
source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/deluged/deluged-constants.sh"
source "$SCRIPTPATH/inc/app-uninstall-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
