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
    source "$SCRIPTPATH/inc/app-install-deps.sh"
    source "$SCRIPTPATH/inc/app-update.sh"

    # Added 15/03/2018 - Can be removed when felt everyone has picked up the required fix
    # New installs has this as default
    if IsSystemdSupported; then
        if ! grep -i 'Type=simple' /etc/systemd/system/transmission-daemon.service.d/override.conf; then
            if sudo sed -i '/\[Service\]/a Type=simple' /etc/systemd/system/transmission-daemon.service.d/override.conf; then
                echo 'Inserted Type=simple into /etc/systemd/system/transmission-daemon.service.d/override.conf'
                systemctl daemon-reload
            fi
        fi
    fi

    source "$SCRIPTPATH/inc/app-start.sh"
    source "$SCRIPTPATH/inc/app-update-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
