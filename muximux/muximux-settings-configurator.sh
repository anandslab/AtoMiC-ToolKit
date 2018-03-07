#!/bin/bash
# Script Name: AtoMiC Muximux settings configurator

echo
echo -e "$YELLOW--->Configuring $APPTITLE Settings...$ENDCOLOR"

sudo chmod 755 -R "$APPPATH"
sudo chown -R www-data:www-data "$APPPATH"
echo "Set the correct folder permissions"
