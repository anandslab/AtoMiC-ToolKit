#!/bin/bash
# shellcheck disable=SC1090
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/inc/app-systemd-remove.sh"
source "$SCRIPTPATH/inc/app-init-remove.sh"
sleep 1
