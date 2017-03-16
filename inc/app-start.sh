#!/bin/bash
echo
echo -e $YELLOW"--->Starting $APPTITLE..."$ENDCOLOR

if [[ -f /etc/init.d/$APPNAME ]]; then
    sudo service $APPNAME start >/dev/null 2>&1
fi

if [[ -f /etc/systemd/system/$APPSYSTEMD ]] || [[ -f /lib/systemd/system/$APPSYSTEMD ]]; then
    sudo systemctl start $APPSYSTEMD
fi

if [[ -f /etc/systemd/system/$APPSYSTEMD2 ]] || [[ -f /lib/systemd/system/$APPSYSTEMD2 ]]; then
    sudo systemctl start $APPSYSTEMD2
fi
