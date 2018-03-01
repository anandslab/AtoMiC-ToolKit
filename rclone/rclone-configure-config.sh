#!/bin/bash

# Script Name: AtoMiC Rclone Configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Configurator Script$ENDCOLOR"
rclone config
source "$SCRIPTPATH/inc/exit.sh"
