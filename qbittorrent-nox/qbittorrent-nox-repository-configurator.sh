#!/bin/bash
# Script Name: AtoMiC qBittorent Restore Script

CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'squeeze'|'wheezy'|'jessie'|'stretch'|'sid')
        APPREPOSITORYLINK=''
        ;;
    *)
        REPOPPA='YES'
        APPREPOSITORYLINK='ppa:qbittorrent-team/qbittorrent-stable'
        ;;
esac
