#!/bin/bash
# Script Name: AtoMiC Muximux settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo
echo -e "$YELLOW--->Configuring $APPTITLE Settings...$ENDCOLOR"

sudo chmod 755 -R "$APPPATH"
sudo chown -R www-data:www-data "$APPPATH"
echo "Set the correct folder permissions"
