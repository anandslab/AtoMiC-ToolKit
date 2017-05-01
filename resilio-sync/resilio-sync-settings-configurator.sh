#!/bin/bash
# Script Name: AtoMiC Resilio Sync settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e "${YELLOW}--->Configuring Resilio Sync Settings...$ENDCOLOR"

sudo sed -i "s@127.0.0.1@0.0.0.0@g" $APPSETTINGS \
|| { echo -e "${RED}Modifying $ACCESSHOST in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }
