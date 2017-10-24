#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Syncthing Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install.sh"
source "$SCRIPTPATH/inc/app-install-deps.sh"
source "$SCRIPTPATH/inc/app-autostart-configure.sh"

source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/inc/app-stop.sh"
echo
echo -e "$YELLOW--->Set to Network Access...$ENDCOLOR"
if sed -i "s@127.0.0.1@0.0.0.0@g" "$APPSETTINGS"; then
    echo 'Done'
else
    echo -e "${RED}Modifying address in $APPSETTINGS file failed.$ENDCOLOR"; exit 1;
fi

source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
