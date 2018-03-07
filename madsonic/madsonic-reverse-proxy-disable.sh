#!/bin/bash
# Script Name: AtoMiC Madsonic Reverse Proxy Disable.

if IsSystemdSupported; then
    if sed -i "/ExecStart=\\/usr\\/bin\\/madsonic/c\\ExecStart=\\/usr\\/bin\\/madsonic" "/etc/systemd/system/$APPSYSTEMD"; then
        echo "Updated context-path in /etc/systemd/system/$APPSYSTEMD"
    fi
else
    if sed -i "s@^MADSONIC_ARGS.*@MADSONIC_ARGS=\"--init-memory=256 --max-memory=512\"@g" "/etc/default/$APPNAME"; then
        echo "Updated context-path in /etc/default/$APPNAME"
    fi
fi

sudo systemctl daemon-reload
