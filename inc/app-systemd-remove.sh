#!/bin/bash

echo
sleep 1

echo -e "$YELLOW--->Removing $APPTITLE Systemd Startup scripts...$ENDCOLOR"

#Check variable set
if [[ -n $APPSYSTEMD ]]; then
    #Check if the systemd file exists
    if  [[ -f /etc/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /usr/lib/systemd/system/$APPSYSTEMD ]] || \
        [[ -L /etc/systemd/system/multi-user.target.wants/$APPSYSTEMD ]] ; then

        if IsSystemdSupported; then
            sudo systemctl stop "$APPSYSTEMD"
            sudo systemctl disable "$APPSYSTEMD"
        fi

        sudo rm "/etc/systemd/system/.$APPSYSTEMD.swp" >/dev/null 2>&1
        sudo rm "/etc/systemd/system/$APPSYSTEMD" >/dev/null 2>&1
        sudo rm "/lib/systemd/system/$APPSYSTEMD" >/dev/null 2>&1
        sudo rm "/usr/lib/systemd/system/$APPSYSTEMD" >/dev/null 2>&1
        sudo rm "/etc/systemd/system/multi-user.target.wants/$APPSYSTEMD" >/dev/null 2>&1

        echo "$APPSYSTEMD SystemD script removed"
    else
        echo "$APPSYSTEMD SystemD script not found"
    fi
fi

if [[ -n $APPSYSTEMD2 ]]; then
    #Check if the second systemd file exists
    if  [[ -f /etc/systemd/system/$APPSYSTEMD2 ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD2 ]] || \
        [[ -f /usr/lib/systemd/system/$APPSYSTEMD2 ]] || \
        [[ -L /etc/systemd/system/multi-user.target.wants/$APPSYSTEMD2 ]] ; then

        if IsSystemdSupported; then
            sudo systemctl stop "$APPSYSTEMD2"
            sudo systemctl disable "$APPSYSTEMD2"
        fi
        sudo rm "/etc/systemd/system/.$APPSYSTEMD2.swp" >/dev/null 2>&1
        sudo rm "/etc/systemd/system/$APPSYSTEMD2" >/dev/null 2>&1
        sudo rm "/lib/systemd/system/$APPSYSTEMD2" >/dev/null 2>&1
        sudo rm "/usr/lib/systemd/system/$APPSYSTEMD2" >/dev/null 2>&1
        sudo rm "/etc/systemd/system/multi-user.target.wants/$APPSYSTEMD2" >/dev/null 2>&1

        echo "$APPSYSTEMD2 SystemD script removed"
    else
        echo "$APPSYSTEMD2 SystemD script not found"
    fi
fi

if [[ -n $APPSYSTEMDOVERIDE ]]; then
    if [[ -f "/etc/systemd/system/$APPNAME.service.d/override.conf" ]] ; then
        sudo rm -r "/etc/systemd/system/$APPNAME.service.d"
        echo "$APPSYSTEMD SystemD override script removed"
    else
        echo "$APPSYSTEMD SystemD override script not found"
    fi
fi

if IsSystemdSupported; then
    sudo systemctl daemon-reload
fi
