#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC1090
# Script Name: AtoMiC Emby Repository Config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

ARCH=$(uname -m)
ARCHSHORT=${ARCH:0:3}
if [ "$ARCHSHORT" = 'arm' ]; then
    TEMPDIST='xUbuntu_14.04'
fi

CODENAME=$(lsb_release -c -s)
if [ "$TEMPDIST" = '' ]; then
   case "$CODENAME" in
    'sid')
        TEMPDIST='Debian_Next'
        ;;
    'stretch')
        TEMPDIST='Debian_9.0'
        ;;
    'jessie')
        TEMPDIST='Debian_8.0'
        ;;
    'wheezy')
        TEMPDIST='Debian_7.0'
        ;;
    'zesty')
        TEMPDIST='xUbuntu_17.04'
        ;;
    'yakkety')
        TEMPDIST='xUbuntu_16.10'
        ;;
    'xenial'|'serena'|'sarah'|'sonya')
        TEMPDIST='xUbuntu_16.04'
        ;;
    'trusty'|'rosa'|'rafaela'|'rebecca'|'qiana')
        TEMPDIST='xUbuntu_14.04'
        ;;
    'precise'|'maya'|'betsy')
        TEMPDIST='xUbuntu_12.04'
        ;;
    *)
        source "$SCRIPTPATH/inc/invalid-option.sh"
        ;;
    esac
fi

if ! [ "$TEMPDIST" = '' ]; then
    APPREPOSITORYLINK="deb http://download.opensuse.org/repositories/home:/emby/$TEMPDIST/ /"
    REPRECVKEYSASC="http://download.opensuse.org/repositories/home:emby/$TEMPDIST/Release.key"
fi
