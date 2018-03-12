#!/bin/bash
# Script Name: AtoMiC Watcher Reverse Proxy Enable.

if sed -i -e 's/\"customwebroot\":\ false,/\"customwebroot\":\ true,/' "$APPSETTINGS"; then
    echo "Updated customwebroot in $APPSETTINGS"
fi

if sed -i -e 's/\"customwebrootpath\":\ .*,/\"customwebrootpath\":\ \"\/watcher\",/' "$APPSETTINGS"; then
    echo "Updated customwebrootpath in $APPSETTINGS"
fi
