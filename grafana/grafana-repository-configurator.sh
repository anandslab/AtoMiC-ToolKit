#!/bin/bash

# Script Name: AtoMiC Grafana Repo Config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

ARCH=$(uname -m)
CODENAME=$(lsb_release -c -s)
    case "$CODENAME" in
        'wheezy')
            TEMPDIST='wheezy' ;;
        *)
            TEMPDIST='jessie' ;;
    esac

    case $ARCH in
        'armv6l')
            # Use for Arm devices such a Raspberry Pi 1
            APPREPOSITORYLINK="deb https://dl.bintray.com/fg2it/deb-rpi-1b $TEMPDIST main"
            REPRECVKEYSASC='https://bintray.com/user/downloadSubjectPublicKey?username=bintray'
            ;;
        'armv7l')
            # Use for Arm devices such a Raspberry Pi 2/3
            APPREPOSITORYLINK="deb https://dl.bintray.com/fg2it/deb $TEMPDIST main"
            REPRECVKEYSASC='https://bintray.com/user/downloadSubjectPublicKey?username=bintray'
            ;;
        *)
            # Default Repo
            APPREPOSITORYLINK='deb https://packagecloud.io/grafana/stable/debian/ jessie main'
            REPRECVKEYSASC='https://packagecloud.io/gpg.key'
            ;;
        esac
# don't set a REPRECVKEYSHORT as we don't want to remove it because its generic.
