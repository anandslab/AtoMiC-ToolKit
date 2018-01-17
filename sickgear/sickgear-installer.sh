#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC SickGear Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-move-previous.sh"
# source "$SCRIPTPATH/utils/python/python-installer.sh"
source "$SCRIPTPATH/inc/app-version-check.sh"

PythonVersion=$(python -V 2>&1 | grep -Po '(?<=Python )(.+)')
vercomp "$PythonVersion" "$APPPYTHONVERREQ"
if [[ $? = 2 ]]; then
    echo -e "${RED}Python Version $PythonVersion is not supported.$ENDCOLOR"
else
    source "$SCRIPTPATH/sickgear/sickgear-constants.sh"
    source "$SCRIPTPATH/inc/app-install-deps.sh"
    source "$SCRIPTPATH/inc/app-git-download.sh"
    source "$SCRIPTPATH/inc/app-autostart-configure.sh"

    cp -a $APPPATH/autoProcessTV/autoProcessTV.cfg.sample $APPPATH/autoProcessTV/autoProcessTV.cfg || { echo -e $RED'Could not copy autoProcess.cfg.'$ENDCOLOR ; exit 1; }

    source "$SCRIPTPATH/inc/app-set-permissions.sh"
    source "$SCRIPTPATH/inc/app-start.sh"
    source "$SCRIPTPATH/inc/app-install-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
