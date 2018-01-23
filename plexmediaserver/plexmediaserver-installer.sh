#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Plex Media Server Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"

source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh"
source "$SCRIPTPATH/plexmediaserver/plexmediaserver-constants.sh"
source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh"

if [[ -z $APPREPOSITORYLINK ]]; then
    echo -e "${RED}Linux Version $CODENAME is not currently supported by Plex.$ENDCOLOR"
else
    source "$SCRIPTPATH/inc/app-repository-add.sh"
    source "$SCRIPTPATH/inc/pkgupdate.sh"
    source "$SCRIPTPATH/inc/app-folders-create.sh"

    if IsSystemdSupported; then
        # Setup the override first so it runs correctly first time.
        # Copies over a service file that will get overridden unless one isnt created. (Dev2day repo currently doesnt) 
        source "$SCRIPTPATH/inc/app-autostart-configure.sh"
        source "$SCRIPTPATH/$APPNAME/$APPNAME-app-install.sh"
    else
        source "$SCRIPTPATH/$APPNAME/$APPNAME-app-install.sh"
        source "$SCRIPTPATH/inc/app-autostart-configure.sh"
    fi

    #Remove the temp repo if there is one
    if [[ -f /etc/apt/sources.list.d/$APPNAME.list.dpkg-old ]]; then
        sudo rm "/etc/apt/sources.list.d/$APPNAME.list.dpkg-old"
    fi

    source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-enable.sh"
    source "$SCRIPTPATH/inc/app-autostart-remove-unrequired-only.sh"
    source "$SCRIPTPATH/inc/app-start.sh"
    source "$SCRIPTPATH/inc/app-install-confirmation.sh"
    echo 'Plex should start within a few seconds depending on the speed of your device.'
    echo -e 'Open '$CYAN'http://localhost:32400/web'$ENDCOLOR' in your browser to continue the setup.'
fi
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
