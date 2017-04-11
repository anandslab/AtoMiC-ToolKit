#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC PHP Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'squeeze'|'wheezy')
        echo "${RED}Distro not curently supported." \
            "Please consider upgrading to a newer version$ENDCOLOR"
        exit 1;;
    'jessie'|'stretch'|'sid')
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
        APPREPOSITORYLINK="deb https://packages.sury.org/php/ $(lsb_release -sc) main"
        APPNAME='php7.0'
        APPDEPS='php7.0-fpm'
        ;;
    *)
        REPOPPA='YES'
        APPREPOSITORYLINK='ppa:ondrej/php'
        APPNAME='php'
        APPDEPS='php-fpm'
        ;;
esac
