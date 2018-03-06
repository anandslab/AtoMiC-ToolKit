#!/bin/bash

# Script Name: AtoMiC qBittorrent Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
echo
echo -e "${YELLOW}By proceeding you are acceping qBittorrent Legal Notice...$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-move-previous.sh"
source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install.sh"

echo
sleep 1
source "$SCRIPTPATH/inc/app-autostart-configure.sh"

echo
sleep 1

source "$SCRIPTPATH/inc/app-folders-create.sh"
if [ ! -f "$APPSETTINGS" ]; then
    sudo cp "$SCRIPTPATH/qbittorrent-nox/qBittorrent.conf" $APPSETTINGS || { echo -e $RED'Conf file not copied.'$ENDCOLOR ; exit 1; }
    source "$SCRIPTPATH/$APPNAME/$APPNAME-settings-configurator.sh"
fi

source "$SCRIPTPATH/inc/app-set-permissions.sh"
source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
