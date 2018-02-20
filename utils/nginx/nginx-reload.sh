#!/bin/bash
echo
echo -e "$YELLOW--->Reload Nginx config file...$ENDCOLOR"
if IsSystemdSupported; then
    if nginx -s reload; then
        echo 'Done'
    fi
else
    if service nginx reload; then
        echo 'Done'
    fi
fi
