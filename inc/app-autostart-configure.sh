#!/bin/bash
# shellcheck disable=SC1090
echo
source "$SCRIPTPATH/inc/app-stop.sh"
echo
echo -e "$YELLOW--->Autostart configuring...$ENDCOLOR"
if IsSystemdSupported; then 
    echo 'Using systemd'

    source "$SCRIPTPATH/inc/app-init-remove.sh"
    source "$SCRIPTPATH/inc/app-systemd-add.sh"
    source "$SCRIPTPATH/$APPNAME/$APPNAME-systemd-update.sh"

elif [[ -d /etc/init.d ]]; then 
    echo 'Using sysv-init'

    source "$SCRIPTPATH/inc/app-systemd-remove.sh"

    #Check if we've already got a default file because of a package install ie. SABnzbd
    if ! [[ -f /etc/default/$APPNAME ]]; then
        source "$SCRIPTPATH/inc/app-default-copy.sh"
    fi

    if [[ -f $SCRIPTPATH/$APPNAME/$APPNAME-default-update.sh ]]; then
        source "$SCRIPTPATH/$APPNAME/$APPNAME-default-update.sh"
    fi

    if ! [[ -f /etc/init.d/$APPNAME ]]; then
        source "$SCRIPTPATH/inc/app-init-add.sh"
    fi

    if [[ -f $SCRIPTPATH/$APPNAME/$APPNAME-init-update.sh ]]; then
        source "$SCRIPTPATH/$APPNAME/$APPNAME-init-update.sh"
    fi
else
    echo -e "${RED}Unknown startup type.$ENDCOLOR"
fi
