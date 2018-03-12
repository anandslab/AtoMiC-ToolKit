#!/bin/bash
# Script Name: AtoMiC Transmission Repo config Script

CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'squeeze'|'wheezy'|'jessie'|'stretch'|'sid')
        APPREPOSITORYLINK='' ;;
    *)
        REPOPPA='YES'
        APPREPOSITORYLINK='ppa:transmissionbt/ppa'
        REPRECVKEYSHORT='365C5CA1' ;;
esac
