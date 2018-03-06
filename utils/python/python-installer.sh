#!/bin/bash
# Script Name: AtoMiC Python Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${GREEN}AtoMiC Python Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/utils/python/python-constants.sh"

if [[ $1 = 'python3' ]]; then
    APPNAME='python3'
    PIP=pip3
fi

source "$SCRIPTPATH/utils/python/python-dependency-configurator.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install.sh"
source "$SCRIPTPATH/inc/app-install-deps.sh"
source "$SCRIPTPATH/inc/app-install-pips.sh" $PIP
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
