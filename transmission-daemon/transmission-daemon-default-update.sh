#!/bin/bash
# Script Name: AtoMiC Transmission default update

echo
echo -e "${YELLOW}--->Updating Default file...$ENDCOLOR"

# [optional] change to 1 to enable daemon
if [[ -f /etc/default/$APPNAME ]]; then
    echo 'Updating default file'
    if sudo sed -i "s@/var/lib/transmission-daemon/info@$APPPATH@g" \
            /etc/default/transmission-daemon || \
            { echo -e "${RED}Replacing config directory in default failed.$ENDCOLOR"; \
            exit 1; }; then
        echo "Set CONFIG DIR to $APPPATH"
    fi
fi

echo 'Updated Default file with new values'
