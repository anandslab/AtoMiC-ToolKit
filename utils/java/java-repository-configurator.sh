#!/bin/bash
# Script Name: AtoMiC Java Repo config Script

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
