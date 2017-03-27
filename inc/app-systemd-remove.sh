#!/bin/bash
echo
sleep 1

echo -e "$YELLOW--->Removing $APPTITLE Systemd Autostart scripts...$ENDCOLOR"

#Check variable set
if [[ ! -z $APPSYSTEMD ]]; then
    #Check if the systemd file exists
    if [[ -f /etc/systemd/system/$APPSYSTEMD ]] || [[ -f /lib/systemd/system/$APPSYSTEMD ]] ; then
        sudo systemctl stop "$APPSYSTEMD" >/dev/null 2>&1
        sudo systemctl disable "$APPSYSTEMD" >/dev/null 2>&1
        sudo rm "/etc/systemd/system/.$APPSYSTEMD.swp" >/dev/null 2>&1
        sudo rm "/etc/systemd/system/$APPSYSTEMD" >/dev/null 2>&1
        sudo rm "/lib/systemd/system/$APPSYSTEMD" >/dev/null 2>&1
        sudo systemctl daemon-reload
        echo "$APPSYSTEMD SystemD script removed"
    else
        echo "$APPSYSTEMD SystemD script not found"
    fi
fi

if [[ ! -z $APPSYSTEMD2 ]]; then
    #Check if the second systemd file exists
    if [[ -f /etc/systemd/system/$APPSYSTEMD2 ]] || [[ -f /lib/systemd/system/$APPSYSTEMD2 ]] ; then
        sudo systemctl stop "$APPSYSTEMD2" >/dev/null 2>&1
        sudo systemctl disable "$APPSYSTEMD2" >/dev/null 2>&1
        sudo rm "/etc/systemd/system/.$APPSYSTEMD2.swp" >/dev/null 2>&1
        sudo rm "/etc/systemd/system/$APPSYSTEMD2" >/dev/null 2>&1
        sudo rm "/lib/systemd/system/$APPSYSTEMD2" >/dev/null 2>&1
        sudo systemctl daemon-reload
        echo "$APPSYSTEMD2 SystemD script removed"
    else
        echo "$APPSYSTEMD2 SystemD script not found"
    fi
fi

if [[ ! -z $APPSYSTEMDOVERIDE ]]; then
    if [[ -f "/etc/systemd/system/$APPNAME.service.d/override.conf" ]] ; then
        sudo rm -r "/etc/systemd/system/$APPNAME.service.d"
        echo "$APPSYSTEMD SystemD override script removed"
    else
        echo "$APPSYSTEMD SystemD override script not found"
    fi
fi
