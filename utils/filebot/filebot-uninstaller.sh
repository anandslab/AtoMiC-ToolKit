#!/bin/bash
# Script Name: AtoMiC FileBot Uninstaller

source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Uninstaller Script$ENDCOLOR"
if IsSystemdSupported; then
    source "$SCRIPTPATH/inc/pause.sh"
    echo
    echo -e "$YELLOW--->Uninstalling snap $APPTITLE package...$ENDCOLOR"
    snap remove "$APPNAME"
    source "$SCRIPTPATH/inc/app-uninstall-confirmation.sh"
else
    echo -e "${RED}Distro not curently supported." \
                "Please consider upgrading to a newer version$ENDCOLOR"
fi
