#!/bin/bash
# shellcheck disable=SC1090
source "$SCRIPTPATH/inc/pause.sh"

if [[ -z $ARGS ]] && [[ -z $CI ]]; then
echo 'test'
    sudo bash "$SCRIPTPATH/setup.sh"
fi
