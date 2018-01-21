#!/bin/bash
# shellcheck disable=SC1090
# shellcheck disable=SC2034
# Script Name: AtoMiC Python Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${GREEN}AtoMiC Python Installer Script$ENDCOLOR"

sudo -H $1 freeze --local | grep -v '^\e' | cut -d = -f 1 | xargs -n1 sudo -H $1 install -U


echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
