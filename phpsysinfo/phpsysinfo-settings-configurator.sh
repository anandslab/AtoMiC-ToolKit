#!/bin/bash
# Script Name: AtoMiC phpSysInfo settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo
echo -e "$YELLOW--->Configuring phpSysInfo Settings...$ENDCOLOR"

if [[ -f "$APPPATH/phpsysinfo.ini" ]]; then
    cp "$APPPATH/phpsysinfo.ini" "$APPPATH\phpsysinfo.ini.bak"
    echo "backed up $APPPATH/phpsysinfo.ini to $APPPATH/phpsysinfo.ini.bak"
fi

sudo cp "$APPPATH/phpsysinfo.ini.new" "$APPPATH/phpsysinfo.ini" || { echo -e "${RED}created new $APPPATH/phpsysinfo.ini$ENDCOLOR"; exit 1; }
echo "created new $APPPATH/phpsysinfo.ini"

sudo sed -i "s@PLUGINS=false@PLUGINS=\"PS,PSStatus,SMART\"@g" "$APPPATH/phpsysinfo.ini" || \
{ echo -e $RED'Modifying "$APPPATH/phpsysinfo.ini" PLUGINS failed.'$ENDCOLOR; exit 1; }

sudo chmod 755 -R "$APPPATH"
sudo chown -R www-data:www-data "$APPPATH"
echo "Set the correct folder permissions"
