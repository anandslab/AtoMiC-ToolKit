#!/bin/bash

# Script Name: AtoMiC Plex Media Server Restore Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

ARCH=$(uname -m)
ARCHSHORT=${ARCH:0:3}
if [[ $ARCHSHORT = 'arm' ]]; then
    # Use the the dev2day repo for arm devices
    APPREPOSITORYLINK="deb https://dev2day.de/pms/ jessie main"
    REPRECVKEYSASC="https://dev2day.de/pms/dev2day-pms.gpg.key"
    REPRECVKEYSHORT='DC9666A8'
else
    CODENAME=$(lsb_release -c -s)
    case "$CODENAME" in
        'wheezy')
            # Use the Debian repo looked after by yakumo on the plex forum
            APPREPOSITORYLINK="deb http://shell.ninthgate.se/packages/debian wheezy main"
            REPRECVKEYSASC="http://shell.ninthgate.se/packages/shell.ninthgate.se.gpg.key"
            REPRECVKEYSHORT='521D8275'
            ;;
        'artful')
            APPREPOSITORYLINK='' ;;
        *)
            # Default to the offical Plex repo
            APPREPOSITORYLINK="deb https://downloads.plex.tv/repo/deb ./public main"
            REPRECVKEYSASC="https://downloads.plex.tv/plex-keys/PlexSign.key"
            REPRECVKEYSHORT='3ADCA79D'
            ;;
        esac
fi
