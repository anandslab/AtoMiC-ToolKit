#!/bin/bash
# Script Name: AtoMiC Flood settings configurator

echo
echo -e "$YELLOW--->Configuring Flood Settings...$ENDCOLOR"

#Copy config.template.js to config.js
if cp "$APPPATH/config.template.js" "$APPPATH/config.js" || \
        { echo -e "${RED}Could not create config.js.$ENDCOLOR"; exit 1; }; then
    echo "Config.js file created"
fi

chown "$UNAME":"$UGROUP" "$APPSETTINGS"
