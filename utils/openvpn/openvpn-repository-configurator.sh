#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC OpenVPN Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
ARCH=$(uname -m)
ARCHSHORT=${ARCH:0:3}
if [[ ! $ARCHSHORT = 'arm' ]]; then
    CODENAME=$(lsb_release -c -s)
    case "$CODENAME" in
        'wheezy'|'jessie'|'precise')
            TEMPDIST=$CODENAME
            ;;
        'trusty'|'rosa'|'rafaela'|'rebecca'|'qiana')
            TEMPDIST='trusty'
            ;;
        'xenial'|'serena'|'sarah')
            TEMPDIST='xenial'
            ;;
    esac
fi

if [[ ! -z $TEMPDIST ]]; then
    APPREPOSITORYLINK="deb http://build.openvpn.net/debian/openvpn/stable $CODENAME main"
    REPRECVKEYSASC="https://swupdate.openvpn.net/repos/repo-public.gpg"
    REPRECVKEYSHORT='F5699905'
    REPOPPA='NO'
    REPOKEYSREQ='YES'
else
    echo 'No repository found that supports your Linux Distribution'
fi
