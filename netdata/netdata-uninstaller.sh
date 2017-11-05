#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC netdata Uninstaller
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Uninstaller Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
if DoesAppFolderExist; then

    echo -e "${CYAN}Answer $ENDCOLOR${GREEN}'y'$ENDCOLOR${CYAN}"\
    "to the following questions to remove the directories$ENDCOLOR"
    echo
    bash "$APPPATH/netdata-uninstaller.sh" --force
    echo
    userdel netdata
    groupdel netdata
    gpasswd -d netdata nginx
    gpasswd -d netdata adm
    gpasswd -d netdata proxy

    source "$SCRIPTPATH/inc/app-uninstall-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
