#!/bin/bash
if [[ `systemctl` =~ -\.mount ]]; then 
    echo using systemd
    source $SCRIPTPATH/inc/app-systemd-add.sh
    source $SCRIPTPATH/$APPNAME/$APPNAME-systemd-update.sh
elif [[ -f /etc/init.d/cron && ! -h /etc/init.d/cron ]]; then 
    echo using sysv-init
else 
    echo 'cannot tell Startup type'
fi
