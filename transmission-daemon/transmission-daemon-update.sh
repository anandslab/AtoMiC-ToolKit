#!/bin/bash
# Script Name: AtoMiC Transmission Updater

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

if DoesAppFolderExist; then
    source "$SCRIPTPATH/inc/app-stop.sh"
    source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-update.sh"
    source "$SCRIPTPATH/transmission-daemon/transmission-daemon-constants.sh"

    #Temp fixes previous incorrect permissions
    sudo chown root:root "/etc/systemd/system/$APPNAME.service.d" || \
    { echo -e "${RED}Chown on $APPSYSTEMDOVERIDELOC failed.$ENDCOLOR"; exit 1; }

    sudo chmod -R 644 "/etc/systemd/system/$APPNAME.service.d" || \
    { echo -e "${RED}Chmod on $APPSYSTEMDOVERIDELOC failed.$ENDCOLOR"; exit 1; }

    source "$SCRIPTPATH/inc/app-install-deps.sh"
    source "$SCRIPTPATH/inc/app-update.sh"
    source "$SCRIPTPATH/inc/app-start.sh"
    source "$SCRIPTPATH/inc/app-update-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
