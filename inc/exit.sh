#!/bin/bash
# shellcheck disable=SC1090
echo
source "$SCRIPTPATH/inc/pause.sh"
if [ -z "$ARGS" ]; then
    sudo bash "$SCRIPTPATH/setup.sh"
fi
