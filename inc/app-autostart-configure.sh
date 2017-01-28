#!/bin/bash
echo
echo -e $YELLOW'--->Autostart configuring...'$ENDCOLOR
if [[ `systemctl` =~ -\.mount ]]; then 
    STARTUPTYPE='systemd'
    echo 'Using systemd'

    #Remove any initd scripts (Only really needed for SABnzbD which installs a init.d script on package install)
    source $SCRIPTPATH/inc/app-init-remove.sh >/dev/null

    source $SCRIPTPATH/inc/app-systemd-add.sh
    source $SCRIPTPATH/$APPNAME/$APPNAME-systemd-update.sh
    
elif [[ -f /etc/init.d/cron && ! -h /etc/init.d/cron ]]; then 
    STARTUPTYPE='sysv-init'
    echo 'Using sysv-init'
    
    #Check if we've already got a default file because of a package install ie. SABnzbd
    if ! [ -f /etc/default/$APPNAME ]; then
    source $SCRIPTPATH/inc/app-default-copy.sh
    fi

    if [ -f $SCRIPTPATH/$APPNAME/$APPNAME-default-update.sh ]; then
        source $SCRIPTPATH/$APPNAME/$APPNAME-default-update.sh
    fi
    
    if ! [ -f /etc/init.d/$APPNAME ]; then
        source $SCRIPTPATH/inc/app-init-add.sh
    fi

    if [ -f $SCRIPTPATH/$APPNAME/$APPNAME-init-update.sh ]; then
        source $SCRIPTPATH/$APPNAME/$APPNAME-init-update.sh
    fi

else 
    STARTUPTYPE='unknown'
    echo $RED'Unknown startup type.'$ENDCOLOR
fi
