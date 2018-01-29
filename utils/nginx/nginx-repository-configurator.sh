#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Nginx Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

CODENAME=$(lsb_release -c -s)

    case "$CODENAME" in
        'squeeze'|'wheezy'|'jessie'|'stretch')
            DIST='debian'
            ;;
        'lucid' | 'oneiric' | 'precise' | 'quantal' | 'raring' | 'saucy' | 'trusty' | 'utopic' | 'vivid' | 'wily' | 'xenial' | 'yakkety' |'zesty')
            DIST='ubuntu'
            ;;
        'sonya' | 'serena' | 'sarah'| 'sylvia')
            DIST='ubuntu'
            CODENAME='xenial'
            ;;
        'rosa' | 'rafaela' | 'rebecca' | 'qiana')
            DIST='ubuntu'
            CODENAME='trusty'
            ;;
        'betsy')
            DIST='debian'
            CODENAME='jessie'
            ;;
    esac

ARCH=$(uname -m)
ARCHSHORT=${ARCH:0:3}
if [[ ! $ARCHSHORT = 'arm' ]]; then
    APPREPOSITORYNAME='nginx'
    APPREPOSITORYLINK="deb http://nginx.org/packages/mainline/$DIST/ $CODENAME nginx"
    APPREPOSITORYLINKBACKUP="deb-src http://nginx.org/packages/mainline/$DIST/ $CODENAME nginx"
    REPRECVKEYSASC='http://nginx.org/keys/nginx_signing.key'
    REPRECVKEYSHORT='7BD9BF62'
    REPOKEYSREQ='YES'
elif [[ $DIST = 'ubuntu' ]]; then
    if [[ $CODENAME = 'trusty' || $CODENAME = 'xenial' || $CODENAME = 'yakkety' ]]; then
        APPREPOSITORYNAME="nginx-development-$CODENAME"
        REPOPPA='YES'
        APPREPOSITORYLINK='ppa:nginx/development'
        REPRECVKEYSHORT='C300EE8C'
    fi
fi
