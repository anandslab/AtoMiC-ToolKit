#!/bin/bash
# Script Name: AtoMiC Resilio Sync settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo
echo -e "${YELLOW}--->Configuring Resilio Sync Settings...$ENDCOLOR"

#Create the user config folder
/etc/resilio-sync/init_user_config.sh

sudo sed -i "s@127.0.0.1@0.0.0.0@g" $APPSETTINGS \
|| { echo -e "${RED}Modifying $ACCESSHOST in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }
