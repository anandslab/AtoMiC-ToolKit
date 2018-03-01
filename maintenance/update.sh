#!/bin/bash


# Script Name: AtoMiC ToolKit Updater
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"

echo -e "${GREEN}AtoMiC ToolKit Updater$ENDCOLOR"
echo
echo -e "${GREEN}This will overwrite any manual changes you made to the script.$ENDCOLOR"
read -p 'Type y/Y and press [ENTER] to continue with update or any other key to exit: '
RESP=${REPLY,,}

if [[ $RESP == 'y' ]]; then
    source "$SCRIPTPATH/inc/pkgupdate.sh"
    APPPATH=$SCRIPTPATH
    echo
    echo -e "${YELLOW}--->Updating AtoMiC ToolKit...$ENDCOLOR"
    git -C "$SCRIPTPATH" fetch --all
    git -C "$SCRIPTPATH" reset --hard origin/master
    source "$SCRIPTPATH/inc/app-set-permissions.sh"
    source "$SCRIPTPATH/inc/app-toolkit-deps.sh"
    echo
    echo -e "${GREEN}AtoMiC ToolKit updated successfully.$ENDCOLOR"
else
    echo -e "${RED}AtoMiC ToolKit not updated.$ENDCOLOR"
fi

source "$SCRIPTPATH/inc/exit.sh"
