#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC1090
# Script Name: AtoMiC Integration Test Application Install Uninstall
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

SCRIPTPATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
CI='YES'
source "$SCRIPTPATH/inc/app-toolkit-deps.sh"
echo
if [[ ! -d $SCRIPTPATH/tmp ]]; then
    mkdir "$SCRIPTPATH/tmp"
fi

if [[ ! -f $SCRIPTPATH/tmp/userinfo ]]; then
    echo "UNAME=$SUDO_USER" > "$SCRIPTPATH/tmp/userinfo"
    echo "UGROUP=$SUDO_USER" >> "$SCRIPTPATH/tmp/userinfo"
fi

if [[ ! -f $SCRIPTPATH/tmp/consented ]]; then
    echo "Agreed to disclaimers: $(date)" > "$SCRIPTPATH/tmp/consented"
fi

source "$SCRIPTPATH/maintenance/distro-update.sh"
source "$SCRIPTPATH/batch-processes/bat-apps-install-uninstall.sh"
