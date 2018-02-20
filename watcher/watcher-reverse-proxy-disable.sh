#!/bin/bash
# Script Name: AtoMiC Watcher Reverse Proxy Disable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i -e 's/\"customwebroot\":\ true,/\"customwebroot\":\ false,/' "$APPSETTINGS"; then
    echo "Updated customwebroot in $APPSETTINGS"
fi

if sed -i -e 's/\"customwebrootpath\":\ .*,/\"customwebrootpath\":\ \"\",/' "$APPSETTINGS"; then
    echo "Updated customwebrootpath in $APPSETTINGS"
fi
