#!/bin/bash

# Script Name: AtoMiC Resilio Sync Repo Config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

ARCH=$(uname -m)
    case $ARCH in
        'armv7l')
            # Use for Arm devices such a Raspberry Pi
            APPREPOSITORYLINK="deb [arch=armhf] http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free"
            ;;
        *)
            # Default Repo
            APPREPOSITORYLINK="deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free"
            ;;
        esac

REPRECVKEYSASC="https://linux-packages.resilio.com/resilio-sync/key.asc"
REPOPPA='NO'
REPOKEYSREQ='YES'
REPRECVKEYSHORT='2484414B'
