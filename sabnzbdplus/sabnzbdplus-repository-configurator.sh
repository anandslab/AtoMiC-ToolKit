#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC SABnzbd+ Restore Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

CODENAME=$(lsb_release -c -s)
REPOPPA='NO'
if [ "$CODENAME" = 'squeeze' ]; then
APPREPOSITORYLINK='deb http://ppa.launchpad.net/jcfp/ppa/ubuntu lucid main'
    REPOKEYSREQ='YES'
elif [ "$CODENAME" = 'wheezy' ]; then
APPREPOSITORYLINK='deb http://ppa.launchpad.net/jcfp/ppa/ubuntu precise main'
    REPOKEYSREQ='YES'
elif [ "$CODENAME" = 'jessie' ]; then
APPREPOSITORYLINK='deb http://ppa.launchpad.net/jcfp/ppa/ubuntu trusty main'
    REPOKEYSREQ='YES'
else
    REPOPPA='YES'
    APPREPOSITORYLINK='ppa:jcfp/ppa'
fi
