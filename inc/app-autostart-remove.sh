#!/bin/bash
# shellcheck disable=SC1090
echo
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/inc/app-init-remove.sh"
source "$SCRIPTPATH/inc/app-systemd-remove.sh"
sleep 1
