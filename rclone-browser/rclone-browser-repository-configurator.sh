#!/bin/bash

# Script Name: AtoMiC Rclone Browser Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'squeeze'|'wheezy'|'jessie'|'stretch'|'sid')
        APPREPOSITORYLINK='' ;;
    'yakkety'|'xenial'|'serena'|'sarah'|'sonya'|'sylvia'|'trusty'|'rosa'|'rafaela'|'rebecca'|'qiana')
        REPOPPA='YES'
        APPREPOSITORYLINK='ppa:mmozeiko/rclone-browser'
        REPRECVKEYSHORT='D67DF04A' ;;
esac
