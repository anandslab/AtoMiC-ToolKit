#!/bin/bash
# Script Name: AtoMiC qBittorrent settings configurator

echo
echo -e "$YELLOW--->Configuring qBittorrent Settings...$ENDCOLOR"

#Set username
sudo sed -i "s@UNAME@$UNAME@g" $APPSETTINGS || \
{ echo -e "${RED}Modifying UNAME in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }
LOCALE=${LANG:0:5}
echo 'Locale found:' $LOCALE
#Set Locale
sudo sed -i "s@Locale=@Locale=$LOCALE@g" $APPSETTINGS || \
{ echo -e "${RED}Modifying LOCALE in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }
