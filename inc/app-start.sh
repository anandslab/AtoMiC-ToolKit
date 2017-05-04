#!/bin/bash
echo
echo -e "$YELLOW--->Starting $APPTITLE...$ENDCOLOR"

if IsSystemdSupported; then
    if  [[ -f /etc/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD ]]; then
        sudo systemctl start $APPSYSTEMD
        echo "$APPSYSTEMD is now: " && systemctl is-active $APPSYSTEMD
    fi

    if  [[ -f /etc/systemd/system/$APPSYSTEMD2 ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD2 ]]; then
        sudo systemctl start $APPSYSTEMD2
        echo "$APPSYSTEMD2 is now: " && systemctl is-active $APPSYSTEMD2
    fi
    
elif [[ -f /etc/init.d/$APPNAME ]]; then
    if [[ -f /etc/init.d/$APPNAME ]]; then
        sudo service $APPNAME start
    fi
else
    echo -e "${RED}Unknown startup type.$ENDCOLOR"
fi
