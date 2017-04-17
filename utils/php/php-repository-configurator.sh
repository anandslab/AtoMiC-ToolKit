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
        ;;
    *)
        REPOPPA='YES'
        APPREPOSITORYLINK='ppa:ondrej/php'
        ;;
esac

ARCH=$(uname -m)
ARCHSHORT=${ARCH:0:3}
if [[ ! $ARCHSHORT = 'arm' ]]; then
    APPNAME='php7.0'
    APPDEPS='php7.0-cli php7.0-common libapache2-mod-php7.0 php7.0-mysql php7.0-fpm php7.0-curl php7.0-gd php7.0-bz2 php7.0-mcrypt php7.0-json php7.0-tidy php7.0-mbstring'
    FPMVERSION='php7.0-fpm'
else
    APPNAME='php7.1'
    APPDEPS='php7.1-cli php7.1-common libapache2-mod-php7.1 php7.1-mysql php7.1-fpm php7.1-curl php7.1-gd php7.1-bz2 php7.1-mcrypt php7.1-json php7.1-tidy php7.1-mbstring php-redis php-memcached'
    FPMVERSION='php7.1-fpm'
fi
