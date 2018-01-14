#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Python Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

CODENAME=$(lsb_release -c -s)

if [[ $APPNAME = 'python3.6' ]]; then 
    case "$CODENAME" in
    'xenial'|'trusty'|'sylvia'|'sonya'|'serena'|'sarah'|'rosa'|'rafaela'|'rebecca'|'qiana'| 'zesty')
        REPOPPA='YES'
        APPREPOSITORYNAME='jonathonf-python-3_6'
        APPREPOSITORYLINK='ppa:jonathonf/python-3.6'
        APPDEPS='python3-pip python3-dev python3-setuptools python-setuptools-doc python3-wheel'
        REPRECVKEYSHORT='' ;;
    *)
        APPREPOSITORYLINK='' ;;
    esac
else
    case "$CODENAME" in
        'xenial'|'trusty'|'sylvia'|'sonya'|'serena'|'sarah'|'rosa'|'rafaela'|'rebecca'|'qiana')
            REPOPPA='YES'
            APPREPOSITORYNAME='jonathonf-python-2_7'
            APPREPOSITORYLINK='ppa:jonathonf/python-2.7'
            APPDEPS='python-pip python-dev python-setuptools python-setuptools-doc python-wheel'
            REPRECVKEYSHORT='' ;;
        *)
            APPREPOSITORYLINK='' ;;
    esac
fi
