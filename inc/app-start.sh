#!/bin/bash
echo
echo -e "$YELLOW--->Starting $APPTITLE...$ENDCOLOR"

if IsSystemdSupported; then
    if  [[ -f /etc/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /usr/lib/systemd/system/$APPSYSTEMD ]] || \
        [[ -L /etc/systemd/system/multi-user.target.wants/$APPSYSTEMD ]] ; then

        FOUND=1
        sudo systemctl start "$APPSYSTEMD"
        sleep 5
        STATUS=$(systemctl is-active "$APPSYSTEMD")
        if [[ $STATUS = 'active' ]]; then
            echo -e "$APPSYSTEMD is now: ${GREEN}$STATUS$ENDCOLOR"
        else
            echo -e "$APPSYSTEMD is now: ${RED}$STATUS$ENDCOLOR"
            exit 1
        fi
    fi

    if  [[ -f /etc/systemd/system/$APPSYSTEMD2 ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD2 ]] || \
        [[ -f /usr/lib/systemd/system/$APPSYSTEMD2 ]] || \
        [[ -L /etc/systemd/system/multi-user.target.wants/$APPSYSTEMD2 ]]; then
        FOUND=1
        sudo systemctl start "$APPSYSTEMD2"
        sleep 5
        STATUS=$(systemctl is-active "$APPSYSTEMD2")
        if [[ $STATUS = 'active' ]]; then
            echo -e "$APPSYSTEMD2 is now: ${GREEN}$STATUS$ENDCOLOR"
        else
            echo -e "$APPSYSTEMD2 is now: ${RED}$STATUS$ENDCOLOR"
            exit 1
        fi
    fi
elif [[ -f /etc/init.d/$APPINITD ]]; then
    FOUND=1
    sudo service "$APPINITD" start
    sleep 5

    if [[ $(ps -ef | grep -v grep | grep -c "$APPINITD" ) != 0 ]]; then
        echo "$APPINITD is running"
    else
        echo "$APPINITD is not running"
        exit 1
    fi
fi

if [[ -n $FOUND ]] && [[ $FOUND = 0 ]]; then
    echo -e "${RED}Startup file not found.$ENDCOLOR"
fi
