#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Node.js Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${GREEN}AtoMiC Node.js Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/utils/nodejs/nodejs-constants.sh"
source "$SCRIPTPATH/utils/nodejs/nodejs-repository-add.sh"
source "$SCRIPTPATH/inc/app-install.sh"
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
