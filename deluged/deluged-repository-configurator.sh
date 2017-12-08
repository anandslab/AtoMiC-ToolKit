#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Deluge Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'squeeze'|'sid')
        APPREPOSITORYLINK=''
        ;;
    'wheezy')
        APPREPOSITORYLINK='deb http://ppa.launchpad.net/deluge-team/ppa/ubuntu precise main'
        ;; 
    'jessie')
        APPREPOSITORYLINK='deb http://ppa.launchpad.net/deluge-team/ppa/ubuntu trusty main'
        ;;
    'stretch')
        APPREPOSITORYLINK='deb http://ppa.launchpad.net/deluge-team/ppa/ubuntu xenial main'
        ;;
    *)
        REPOPPA='YES'
        APPREPOSITORYLINK='ppa:deluge-team/ppa'
        ;;
esac

if [[ -n $APPREPOSITORYLINK ]]; then
    REPRECVKEYSHORT='249AD24C'
fi
