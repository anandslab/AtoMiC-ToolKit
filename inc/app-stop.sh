#!/bin/bash
echo 
echo -e "${YELLOW}--->Stopping $APPTITLE...$ENDCOLOR"

if IsSystemdSupported; then
    if  [[ -f /etc/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /usr/lib/systemd/system/$APPSYSTEMD ]]; then
        sudo systemctl stop $APPSYSTEMD
        echo "$APPSYSTEMD is now: " && \
        systemctl is-active $APPSYSTEMD
        FOUND=1
    fi

    if  [[ -f /etc/systemd/system/$APPSYSTEMD2 ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /usr/lib/systemd/system/$APPSYSTEMD2 ]]; then
        sudo systemctl stop $APPSYSTEMD2
        echo "$APPSYSTEMD2 is now: " && \
        systemctl is-active $APPSYSTEMD2
        FOUND=1
    fi
    
elif [[ -f /etc/init.d/$APPNAME ]]; then
    if [[ -f /etc/init.d/$APPNAME ]]; then
        sudo service $APPNAME stop
        FOUND=1
    fi
fi

sleep 2

if [[ ! -z $FOUND ]] && [[ $FOUND > 0 ]]; then
    sudo killall $APPNAME >/dev/null 2>&1
else
    echo 'Nothing found to stop'
fi
