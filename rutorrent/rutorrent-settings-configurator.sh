#!/bin/bash
# Script Name: AtoMiC rutorrent settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo
echo -e "$YELLOW--->Configuring rutorrent Settings...$ENDCOLOR"

sudo chown -R www-data:www-data "$APPPATH"
echo "Set the correct folder permissions"

#Set curl location
sudo sed -i "s@\"curl\"	=> '',@\"curl\"	=> '/usr/bin/curl',@g" "$APPSETTINGS" \
|| { echo -e "${RED}Modifying CURL LOCATION in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }
