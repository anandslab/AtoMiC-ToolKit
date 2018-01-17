#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC NZBHydra Installer
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-move-previous.sh"
source "$SCRIPTPATH/utils/python/python-installer.sh"
source "$SCRIPTPATH/inc/app-version-check.sh"

PythonVersion=$(python -V 2>&1 | grep -Po '(?<=Python )(.+)')
vercomp "$PythonVersion" "$APPPYTHONVERREQ"
if [[ $? = 2 ]]; then
    echo -e "${RED}Python Version $PythonVersion is not supported.$ENDCOLOR"
else
    source "$SCRIPTPATH/nzbhydra/nzbhydra-constants.sh"
    source "$SCRIPTPATH/inc/app-git-download.sh"
    source "$SCRIPTPATH/inc/app-autostart-configure.sh"
    source "$SCRIPTPATH/inc/app-set-permissions.sh"
    source "$SCRIPTPATH/inc/app-start.sh"
    source "$SCRIPTPATH/inc/app-install-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi

source "$SCRIPTPATH/inc/exit.sh"
