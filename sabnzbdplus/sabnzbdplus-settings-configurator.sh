#!/bin/bash
# Script Name: AtoMiC SABnzbd+ settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e "$YELLOW--->Configuring SABnzbd+ Settings...$ENDCOLOR"
echo 'Set to Network Access'
sudo sed -i "s@^${ACCESSHOST}.*@${ACCESSHOST}0.0.0.0@g" $APPSETTINGS || { echo -e $RED'Modifying '$ACCESSHOST' in '$APPSETTINGS' file failed.'$ENDCOLOR; exit 1; }
sudo -H pip install sabyenc --upgrade
