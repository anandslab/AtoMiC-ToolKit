#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Resilio Sync Repo Config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

ARCH=$(uname -m)
    case $ARCH in
        'armhf')
            # Use for Arm devices such a Raspberry Pi
            APPREPOSITORYLINK="deb [arch=armhf] http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free"
            ;;
        *)
            # Default Repo
            APPREPOSITORYLINK="deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free"
            ;;
        esac

REPRECVKEYSASC="https://linux-packages.resilio.com/resilio-sync/key.asc"
REPRECVKEYSHORT=''
