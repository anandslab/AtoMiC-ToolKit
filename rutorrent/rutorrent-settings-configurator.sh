#!/bin/bash
# Script Name: AtoMiC rutorrent settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

echo
echo -e "$YELLOW--->Configuring rutorrent Settings...$ENDCOLOR"

sudo chmod 755 -R "$APPPATH"
sudo chown -R www-data:www-data "$APPPATH"
echo "Set the correct folder permissions"

#Set curl location
sudo sed -i "s@\"curl\"	=> '',@\"curl\"	=> '/usr/bin/curl',@g" "$APPSETTINGS" \
|| { echo -e "${RED}Modifying CURL LOCATION in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }

#Set Stat location
sudo sed -i "s@\"stat\"	=> '',@\"stat\"	=> '/usr/bin/stat',@g" "$APPSETTINGS" \
|| { echo -e "${RED}Modifying STAT LOCATION in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }
