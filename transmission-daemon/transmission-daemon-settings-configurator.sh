#!/bin/bash
# Script Name: AtoMiC Transmission settings configurator

echo
echo -e "$YELLOW--->Configuring Transmission Settings...$ENDCOLOR"

#Set to allow network access instead of localhost.
if sudo sed -i "s@\"rpc-whitelist-enabled\": \
        true@\"rpc-whitelist-enabled\": false@g" "$APPSETTINGS" || \
        { echo -e "${RED}Modifying whitelist enabled in \
        $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }; then
    echo 'Whitelist disabled'
fi

#Enable incomplete folder & destination
if sudo sed -i "s@\"incomplete-dir-enabled\": false@\"incomplete-dir-enabled\": true@g" "$APPSETTINGS"  || \
        { echo -e "${RED}Modifying incomplete enabled in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }; then
    echo 'incomplete-dir-enabled'
fi

if sudo sed -i "s@\"incomplete-dir\": \"/home/$UNAME/Downloads\"@\"incomplete-dir\": \"/home/$UNAME/Downloads/transmission/incomplete\"@g" "$APPSETTINGS" || \
        { echo -e "${RED}Modifying incomplete location in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }; then
    echo "incomplete-dir set to /home/$UNAME/Downloads/transmission/incomplete"
fi

#Set download folder destination
if sudo sed -i "s@\"download-dir\": \"/home/$UNAME/Downloads\"@\"download-dir\": \"/home/$UNAME/Downloads/transmission/completed\"@g" "$APPSETTINGS" || \
        { echo -e "${RED}Modifying completed location in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }; then
    echo "download-dir set to /home/$UNAME/Downloads/transmission/completed"
fi

#Set Watch folder enabled & destination (utp now needs a comma)
if sudo sed -i "s@\"utp-enabled\": true@\"utp-enabled\": true,@g" "$APPSETTINGS" || \
        { echo -e "${RED}Modifying Utp in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }; then
    echo 'utp-enabled'
fi

if sudo sed -i "/\"utp-enabled\": true,/a \\ \\ \\ \\ \"watch-dir-enabled\": true" "$APPSETTINGS" || \
        { echo -e "${RED}Adding Watch enabled in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }; then
    echo 'watch-dir-enabled'
fi

if sudo sed -i "/\"utp-enabled\": true,/a \\ \\ \\ \\ \"watch-dir\": \"/home/$UNAME/Downloads/transmission/watch\"," "$APPSETTINGS" || \
        { echo -e "${RED}Adding watch location in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }; then
    echo "Watch location set to /home/$UNAME/Downloads/transmission/watch"
fi
