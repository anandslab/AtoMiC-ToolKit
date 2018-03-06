#!/bin/bash
# Script Name: AtoMiC SABnzbd+ settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "$YELLOW--->Configuring SABnzbd+ Settings...$ENDCOLOR"
echo 'Set to Network Access'

sudo sed -i "s@^${ACCESSHOST}.*@${ACCESSHOST}0.0.0.0@g" \
"$APPSETTINGS" || { echo -e "${RED}Modifying $ACCESSHOST \
in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }

sudo sed -i "s@download_dir = Downloads/incomplete@download_dir = \
/home/$UNAME/Downloads/sabnzbdplus/incomplete@g" "$APPSETTINGS" || \
{ echo -e "${RED}Modifying incomplete location in \
$APPSETTINGS file failed.$ENDCOLOR"; exit 1; }

sudo sed -i "s@complete_dir = Downloads/complete@complete_dir = \
/home/$UNAME/Downloads/sabnzbdplus/complete@g" "$APPSETTINGS" || \
{ echo -e "${RED}Modifying incomplete location in \
$APPSETTINGS file failed.$ENDCOLOR"; exit 1; }
