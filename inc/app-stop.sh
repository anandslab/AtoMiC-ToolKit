#!/bin/bash
echo 
echo -e "${YELLOW}--->Stopping $APPTITLE...$ENDCOLOR"

if IsSystemdSupported; then
    if  [[ -f /etc/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /usr/lib/systemd/system/$APPSYSTEMD ]]; then
        FOUND=1
        sudo systemctl stop $APPSYSTEMD
        STATUS=$(systemctl is-active $APPSYSTEMD)
        if [[ $STATUS = 'active' ]]; then
            echo -e "$APPSYSTEMD is now: ${GREEN}$STATUS$ENDCOLOR" 
        else
            echo -e "$APPSYSTEMD is now: ${RED}$STATUS$ENDCOLOR"
        fi
    fi

    if  [[ -f /etc/systemd/system/$APPSYSTEMD2 ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD2 ]] || \
        [[ -f /usr/lib/systemd/system/$APPSYSTEMD2 ]]; then
        FOUND=1
        sudo systemctl stop $APPSYSTEMD2
        STATUS=$(systemctl is-active $APPSYSTEMD2)
        if [[ $STATUS = 'active' ]]; then
            echo -e "$APPSYSTEMD2 is now: ${GREEN}$STATUS$ENDCOLOR" 
        else
            echo -e "$APPSYSTEMD2 is now: ${RED}$STATUS$ENDCOLOR"
        fi
    fi
    
elif [[ -f /etc/init.d/$APPINITD ]]; then
    FOUND=1
    sudo service $APPNAME stop
elif [[ -f /etc/init.d/$APPINITD ]]; then
    FOUND=1
    sudo service $APPINITD stop
fi

sleep 2

if [[ ! -z $FOUND ]] && [[ $FOUND = 1 ]]; then
    sudo killall $APPNAME >/dev/null 2>&1
else
    echo 'Nothing found to stop'
fi
