#!/bin/bash
# Script Name: AtoMiC Resilio Sync settings configurator

echo
echo -e "${YELLOW}--->Configuring Resilio Sync Settings...$ENDCOLOR"

#Create the user config folder if required
sudo -u "$UNAME" bash "/etc/resilio-sync/init_user_config.sh"

echo 'Set to Network Access'
sudo sed -i "s@127.0.0.1@0.0.0.0@g" "$APPSETTINGS" || \
{ echo -e "${RED}Modifying $ACCESSHOST in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }
