#!/bin/bash
# Script Name: AtoMiC Mono Repo config Script

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
            TEMPDIST='debian raspbianjessie'
            ;;
        'stretch')
            TEMPDIST='debian raspbianstretch'
            ;;
    esac
else
    case "$CODENAME" in
        'wheezy')
            TEMPDIST='debian wheezy'
            ;;
        'jessie')
            TEMPDIST='debian jessie'
            ;;
        'stretch')
            TEMPDIST='debian stretch'
            ;;
        'xenial'|'serena'|'sarah'|'sonya'|'sylvia'|'zesty'|'yakkety'|'artful')
            TEMPDIST='ubuntu xenial'
            ;;
        'trusty'|'rosa'|'rafaela'|'rebecca'|'qiana')
            TEMPDIST='ubuntu trusty'
            ;;
        'precise'|'maya'|'betsy')
            TEMPDIST='ubuntu precise'
            ;;
        *)
            source "$SCRIPTPATH/inc/invalid-option.sh"
            ;;
    esac
fi

if [[ ! $TEMPDIST = '' ]]; then
    APPREPOSITORYLINK="deb http://download.mono-project.com/repo/$TEMPDIST main"
fi
