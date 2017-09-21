#!/bin/bash
# shellcheck disable=SC1090
echo
source "$SCRIPTPATH/inc/app-stop.sh"
echo
echo -e "$YELLOW--->Autostart Removing any unrequired files...$ENDCOLOR"
if IsSystemdSupported; then 
    echo 'Using systemd so removing any sysv-init files'

    source "$SCRIPTPATH/inc/app-init-remove.sh" >/dev/null
    sudo systemctl daemon-reload
    sudo systemctl enable $APPSYSTEMD 

elif [[ -d /etc/init.d ]]; then 
    echo 'Using sysv-init so removing any systemd files'

    source "$SCRIPTPATH/inc/app-systemd-remove.sh" >/dev/null
    sudo chown $UNAME:$UGROUP /etc/init.d/$APPINITD
    sudo update-rc.d $APPINITD defaults
else 
    echo -e "${RED}Unknown startup type.$ENDCOLOR"
fi
