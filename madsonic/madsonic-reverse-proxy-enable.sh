#!/bin/bash
# Script Name: AtoMiC Madsonic Reverse Proxy Enable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if IsSystemdSupported; then
    if sed -i "/ExecStart=\\/usr\\/bin\\/madsonic/c\\ExecStart=\\/usr\\/bin\\/madsonic --context-path=\\/madsonic" "/etc/systemd/system/$APPSYSTEMD"; then
        echo "Updated context-path in /etc/systemd/system/$APPSYSTEMD"
    fi
else
    if sed -i "s@^MADSONIC_ARGS.*@MADSONIC_ARGS=\"--context-path=\\/madsonic --init-memory=256 --max-memory=512\"@g" "/etc/default/$APPNAME"; then
        echo "Updated context-path in /etc/default/$APPNAME"
    fi
fi

sudo systemctl daemon-reload
source "$SCRIPTPATH/inc/app-start.sh"
sleep 5
