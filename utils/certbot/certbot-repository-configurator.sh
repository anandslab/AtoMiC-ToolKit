#!/bin/bash
# Script Name: AtoMiC Certbot Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'squeeze'|'wheezy'|'jessie'|'stretch'|'sid')
        ;;
    *)
        REPOPPA='YES'
        APPREPOSITORYLINK='ppa:certbot/certbot'
        ;;
esac
