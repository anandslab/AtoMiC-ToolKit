#!/bin/bash
# Script Name: AtoMiC Kodi Repo Config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

ARCH=$(uname -m)
ARCHSHORT=${ARCH:0:3}
if [ "$ARCHSHORT" = 'arm' ]; then
    # Use the Debian repo looked after by yakumo on the plex forum
    APPREPOSITORYNAME='pipplware_jessie'
    APPREPOSITORYLINK="deb http://pipplware.pplware.pt/pipplware/dists/jessie/main/binary /"
    APPREPOSITORYLINKBACKUP="deb http://pipplware.pplware.pt/pipplware/dists/jessie/armv7/binary/ /"
    REPRECVKEYSASC="http://pipplware.pplware.pt/pipplware/key.asc"
    REPRECVKEYSHORT='BAA567BB'
    REPOKEYSREQ='YES'
else
    APPREPOSITORYNAME='team-xbmc'
    REPOPPA='YES'
    APPREPOSITORYLINK='ppa:team-xbmc/ppa'
    REPRECVKEYSHORT='91E7EE5E'
fi
