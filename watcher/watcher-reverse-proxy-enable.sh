#!/bin/bash
# Script Name: AtoMiC Watcher Reverse Proxy Enable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i -e 's/\"customwebroot\":\ false,/\"customwebroot\":\ true,/' "$APPSETTINGS"; then
    echo "Updated customwebroot in $APPSETTINGS"
fi

if sed -i -e 's/\"customwebrootpath\":\ .*,/\"customwebrootpath\":\ \"\/watcher\",/' "$APPSETTINGS"; then
    echo "Updated customwebrootpath in $APPSETTINGS"
fi
