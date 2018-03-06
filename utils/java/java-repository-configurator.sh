#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Java Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)


CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'squeeze'|'wheezy'|'jessie'|'stretch'|'sid')
        APPREPOSITORYLINK='deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main'
        APPREPOSITORYLINKBACKUP='deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main'
        REPKEYSERVER='hkp://keyserver.ubuntu.com:80'
        REPOKEYSREQ='YES'
        ;;
    *)
        REPOPPA='YES'
        APPREPOSITORYLINK='ppa:webupd8team/java'
        ;;
esac
