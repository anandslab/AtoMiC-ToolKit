#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Python Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

CODENAME=$(lsb_release -c -s)

if [[ $APPNAME = 'python3' ]]; then
    APPDEPS='python3-pip python3-dev python3-setuptools python-setuptools-doc python3-wheel'
    APPPIPS='cffi enum34 asn1crypto idna six ipaddress pycparser chardet urllib3 pycparser markdown asn1crypto pyasn1 lxml setuptools regex certifi cryptography pyopenssl requests[security]'
else
    case "$CODENAME" in
        'xenial'|'trusty'|'sylvia'|'sonya'|'serena'|'sarah'|'rosa'|'rafaela'|'rebecca'|'qiana')
            REPOPPA='YES'
            APPREPOSITORYNAME='jonathonf-python-2_7'
            APPREPOSITORYLINK='ppa:jonathonf/python-2.7'
            APPDEPS='python-pip python-dev python-setuptools python-setuptools-doc python-wheel'
            APPPIPS='cffi enum34 asn1crypto idna six ipaddress pycparser chardet urllib3 pycparser markdown asn1crypto pyasn1 lxml setuptools regex certifi cheetah cryptography pyopenssl requests[security]'
            ;;
        *)
            APPREPOSITORYLINK='' ;;
    esac

fi
