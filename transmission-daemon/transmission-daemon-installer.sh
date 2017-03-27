#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Transmission Installer
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"

echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"

source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-move-previous.sh"
source "$SCRIPTPATH/inc/app-uninstall.sh"
source "$SCRIPTPATH/inc/app-uninstall-deps.sh"
source "$SCRIPTPATH/$APPNAME/$APPNAME-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install-deps.sh"
source "$SCRIPTPATH/inc/app-folders-create.sh"

# Just adds the override and updates it for systemd.
source "$SCRIPTPATH/inc/app-autostart-configure.sh"

source "$SCRIPTPATH/inc/app-install.sh"

if ! grep -qF 'net.core.rmem_max' /etc/sysctl.conf;then
    echo -e "${YELLOW}--->$APPNAME UTP & UDP Buffer Optimizations...$ENDCOLOR"
    echo 'net.core.rmem_max = 16777216' >> /etc/sysctl.conf
    echo 'net.core.wmem_max = 4194304' >> /etc/sysctl.conf
    sysctl -p
    echo
fi

source "$SCRIPTPATH/inc/app-autostart-remove-unrequired-only.sh"

#Need to do this seperately as the init\default files wouldnt have existed before the install.
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/inc/app-autostart-configure.sh"

source "$SCRIPTPATH/inc/app-set-permissions.sh"
source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-installer.sh"
source "$SCRIPTPATH/transmission-daemon/transmission-daemon-constants.sh"
source "$SCRIPTPATH/inc/app-start.sh"
sleep 2
source "$SCRIPTPATH/$APPNAME/$APPNAME-settings-configurator.sh"
kill -s SIGHUP "$(pidof transmission-daemon)" >/dev/null 2>&1
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
