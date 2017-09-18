#!/bin/bash
echo
echo -e "$YELLOW--->Starting $APPTITLE...$ENDCOLOR"

if IsSystemdSupported; then
    if  [[ -f /etc/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /usr/lib/systemd/system/$APPSYSTEMD ]]; then
        sudo systemctl start $APPSYSTEMD
        echo "Starting $APPSYSTEMD"
        sleep 5
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
        sudo systemctl start $APPSYSTEMD2
        echo "Starting $APPSYSTEMD2" 
        sleep 5
        STATUS=$(systemctl is-active $APPSYSTEMD)
        if [[ $STATUS = 'active' ]]; then
            echo -e "$APPSYSTEMD2 is now: ${GREEN}$STATUS$ENDCOLOR" 
        else
            echo -e "$APPSYSTEMD2 is now: ${RED}$STATUS$ENDCOLOR"
        fi
    fi
    
elif [[ -f /etc/init.d/$APPNAME ]]; then
    if [[ -f /etc/init.d/$APPNAME ]]; then
        sudo service $APPNAME start
    fi
else
    echo -e "${RED}Unknown startup type.$ENDCOLOR"
fi
