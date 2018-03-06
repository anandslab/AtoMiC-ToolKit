#!/bin/bash
# Script Name: AtoMiC Deluge Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-move-previous.sh"
source "$SCRIPTPATH/inc/app-uninstall.sh"
source "$SCRIPTPATH/inc/app-uninstall-deps.sh"
source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"

source "$SCRIPTPATH/utils/python/python-installer.sh"
source "$SCRIPTPATH//qbittorrent-nox/qbittorrent-nox-constants.sh"
source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh"
if [[ -n $APPREPOSITORYLINK ]]; then
    echo
    echo -e "$YELLOW--->Add qBittorrent-nox so we can get the latest libtorrent-rasterbar that it keeps up-to-date...$ENDCOLOR"
fi
source "$SCRIPTPATH/inc/app-repository-add.sh"

source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-installer.sh"
source "$SCRIPTPATH/deluged/deluged-constants.sh"
source "$SCRIPTPATH/inc/app-install.sh"
source "$SCRIPTPATH/inc/app-install-deps.sh"
source "$SCRIPTPATH/inc/app-folders-create.sh"
source "$SCRIPTPATH/inc/app-autostart-configure.sh"
source "$SCRIPTPATH/inc/app-set-permissions.sh"
source "$SCRIPTPATH/inc/app-start.sh"
sleep 10
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/$APPNAME/$APPNAME-settings-configurator.sh"
source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
