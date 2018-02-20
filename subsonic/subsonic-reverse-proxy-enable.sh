#!/bin/bash
# Script Name: AtoMiC Subsonic Reverse Proxy Enable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i "/ExecStart=\\/usr\\/bin\\/subsonic/c\\ExecStart=\\/usr\\/bin\\/subsonic --context-path=\\/subsonic" "/etc/systemd/system/$APPSYSTEMD"; then
    echo "Updated context-path in /etc/systemd/system/$APPSYSTEMD"
fi

sudo systemctl daemon-reload
