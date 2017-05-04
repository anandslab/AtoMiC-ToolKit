#!/bin/bash
# Script Name: AtoMiC qBittorrent settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo 
echo -e "$YELLOW--->Configuring qBittorrent Settings...$ENDCOLOR"

#Set username
sudo sed -i "s@UNAME@$UNAME@g" $APPSETTINGS || \
{ echo -e $RED"Modifying UNAME in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }
LOCALE=${LANG:0:5}
echo 'Locale found:' $LOCALE
#Set Locale
sudo sed -i "s@Locale=@Locale=$LOCALE@g" $APPSETTINGS || \
{ echo -e $RED"Modifying LOCALE in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }
