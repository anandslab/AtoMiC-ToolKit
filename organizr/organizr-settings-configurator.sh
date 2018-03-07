#!/bin/bash
# Script Name: AtoMiC Organizr settings configurator

echo
echo -e "$YELLOW--->Configuring Organizr Settings...$ENDCOLOR"

sudo chmod 755 -R "$APPPATH"
sudo chown -R www-data:www-data "$APPPATH"
echo "Set the correct folder permissions"
