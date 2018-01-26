#!/bin/bash
# shellcheck disable=SC1090
source "$SCRIPTPATH/inc/pause.sh"

if [[ -z $ARGS ]] && [[ -z $CI ]]; then
    sudo bash "$SCRIPTPATH/setup.sh"
fi
