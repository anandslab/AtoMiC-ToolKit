#!/bin/bash
# Script Name: AtoMiC Rclone Configurator

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Configurator Script$ENDCOLOR"
rclone config
source "$SCRIPTPATH/inc/exit.sh"
