#!/bin/bash
# shellcheck disable=SC1090
# shellcheck disable=SC2034
# Force a full update, distro upgrade and autoclean
#export TERM=xterm

SCRIPTPATH="$(dirname "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" )"

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
CI='YES'

if [[ ! -d $SCRIPTPATH/tmp ]]; then
    mkdir "$SCRIPTPATH/tmp"
fi

source "$SCRIPTPATH/maintenance/distro-update.sh"
source "$SCRIPTPATH/batch-processes/bat-apps-update.sh"
