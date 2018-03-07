#!/bin/bash
# Script Name: AtoMiC Subsonic Reverse Proxy Disable.

if IsSystemdSupported; then
    if sed -i "/ExecStart=\\/usr\\/bin\\/subsonic/c\\ExecStart=\\/usr\\/bin\\/subsonic" "/etc/systemd/system/$APPSYSTEMD"; then
        echo "Updated context-path in /etc/systemd/system/$APPSYSTEMD"
    fi
else
    if sed -i "s@^SUBSONIC_ARGS.*@SUBSONIC_ARGS=\"--max-memory=500\"@g" "/etc/default/$APPNAME"; then
        echo "Updated context-path in /etc/default/$APPNAME"
    fi
fi

sudo systemctl daemon-reload
