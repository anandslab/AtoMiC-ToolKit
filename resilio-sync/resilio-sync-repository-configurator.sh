#!/bin/bash
# Script Name: AtoMiC Resilio Sync Repo Config Script

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
