#!/bin/bash
# Script Name: AtoMiC Madsonic Reverse Proxy Enable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i "/ExecStart=\\/usr\\/bin\\/madsonic/c\\ExecStart=\\/usr\\/bin\\/madsonic --context-path=\\/madsonic" "/etc/systemd/system/$APPSYSTEMD"; then
    echo "Updated context-path in /etc/systemd/system/$APPSYSTEMD"
fi

sudo systemctl daemon-reload
source "$SCRIPTPATH/inc/app-start.sh"
sleep 5
