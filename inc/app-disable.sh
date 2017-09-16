#!/bin/bash
echo 
echo -e $YELLOW"--->Disabling $APPTITLE..."$ENDCOLOR

if [ -f /etc/init.d/$APPNAME ]; then
    echo "/etc/init.d/$APPNAME Disabled"
    update-rc.d $APPNAME disable
fi

if [[ -f /etc/systemd/system/$APPSYSTEMD ]] ; then
    echo "/etc/systemd/system/$APPSYSTEMD Disabled"
    sudo systemctl disable $APPSYSTEMD
fi

if [[ -f /lib/systemd/system/$APPSYSTEMD ]]; then
    echo "/lib/systemd/system/$APPSYSTEMD Disabled"
    sudo systemctl disable $APPSYSTEMD
fi

if [[ -f /usr/lib/systemd/system/$APPSYSTEMD ]]; then
    echo "usr/lib/systemd/system/$APPSYSTEMD Disabled"
    sudo systemctl disable $APPSYSTEMD
fi

if [[ -f /etc/systemd/system/$APPSYSTEMD2 ]] ; then
    echo "/etc/systemd/system/$APPSYSTEMD2 Disabled"
    sudo systemctl disable $APPSYSTEMD2
fi

if [[ -f /lib/systemd/system/$APPSYSTEMD2 ]]; then
    echo "/lib/systemd/system/$APPSYSTEMD2 Disabled"
    sudo systemctl disable $APPSYSTEMD2
fi

if [[ -f /usr/lib/systemd/system/$APPSYSTEMD2 ]]; then
    echo "/usr/lib/systemd/system/$APPSYSTEMD2 Disabled"
    sudo systemctl disable $APPSYSTEMD2
fi

sleep 2

sudo killall $APPNAME >/dev/null 2>&1
