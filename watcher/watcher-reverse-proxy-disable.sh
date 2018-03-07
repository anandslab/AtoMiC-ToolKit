#!/bin/bash
# Script Name: AtoMiC Watcher Reverse Proxy Disable.

if sed -i -e 's/\"customwebroot\":\ true,/\"customwebroot\":\ false,/' "$APPSETTINGS"; then
    echo "Updated customwebroot in $APPSETTINGS"
fi

if sed -i -e 's/\"customwebrootpath\":\ .*,/\"customwebrootpath\":\ \"\",/' "$APPSETTINGS"; then
    echo "Updated customwebrootpath in $APPSETTINGS"
fi
