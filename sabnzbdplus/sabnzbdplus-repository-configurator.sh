#!/bin/bash
# Script Name: AtoMiC SABnzbd+ Restore Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

CODENAME=$(lsb_release -c -s)
REPOPPA='NO'
if [[ $CODENAME = 'squeeze' ]]; then
APPREPOSITORYLINK='deb http://ppa.launchpad.net/jcfp/ppa/ubuntu lucid main'
    REPOKEYSREQ='YES'
elif [[ $CODENAME = 'wheezy' ]]; then
APPREPOSITORYLINK='deb http://ppa.launchpad.net/jcfp/ppa/ubuntu precise main'
    REPOKEYSREQ='YES'
elif [[ $CODENAME = 'jessie' ]]; then
APPREPOSITORYLINK='deb http://ppa.launchpad.net/jcfp/ppa/ubuntu trusty main'
    REPOKEYSREQ='YES'
elif [[ $CODENAME = 'stretch' ]]; then
APPREPOSITORYLINK='deb http://ppa.launchpad.net/jcfp/ppa/ubuntu xenial main'
    REPOKEYSREQ='YES'
else
    REPOPPA='YES'
    APPREPOSITORYLINK='ppa:jcfp/ppa'
fi
