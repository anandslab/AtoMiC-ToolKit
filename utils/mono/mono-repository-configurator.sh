#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Mono Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# Remove the old repo if it exists
if [[ -f /etc/apt/sources.list.d/mono-xamarin.list ]]; then
    echo -e "${YELLOW}---> Removing old mono-xamarin.list...$ENDCOLOR"
    sudo rm "/etc/apt/sources.list.d/mono-xamarin.list"
    echo 'Done'
fi

ARCH=$(uname -m)
ARCHSHORT=${ARCH:0:3}
CODENAME=$(lsb_release -c -s)
if [[ $ARCHSHORT = 'arm' ]] && [[ $CODENAME = 'jessie' || $CODENAME = 'stretch' ]]; then
        case "$CODENAME" in
        'jessie')
            TEMPDIST='raspbianjessie'
            ;;
        'stretch')
            TEMPDIST='raspbianstretch'
            ;;
    esac
else
    case "$CODENAME" in
        'wheezy')
            TEMPDIST='wheezy'
            ;;
        'jessie')
            TEMPDIST='jessie'
            ;;
        'stretch')
            TEMPDIST='stretch'
            ;;    
        'xenial'|'serena'|'sarah'|'sonya'|'zesty'|'yakkety'|'artful')
            TEMPDIST='xenial'
            ;;
        'trusty'|'rosa'|'rafaela'|'rebecca'|'qiana')
            TEMPDIST='trusty'
            ;;
        'precise'|'maya'|'betsy')
            TEMPDIST='precise'
            ;;
        *)
            source "$SCRIPTPATH/inc/invalid-option.sh"
            ;;
    esac
fi

if [[ ! $TEMPDIST = '' ]]; then
    APPREPOSITORYLINK="deb http://download.mono-project.com/repo/ubuntu $TEMPDIST main"
fi
