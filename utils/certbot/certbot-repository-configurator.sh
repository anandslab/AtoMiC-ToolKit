#!/bin/bash
# Script Name: AtoMiC Certbot Repo config Script

CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'squeeze'|'wheezy'|'jessie'|'stretch'|'sid')
        ;;
    *)
        REPOPPA='YES'
        APPREPOSITORYLINK='ppa:certbot/certbot'
        ;;
esac
