#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Mono Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'squeeze'|'wheezy'|'jessie'|'stretch'|'sid')
        APPREPOSITORYLINKBACKUP="deb http://download.mono-project.com/repo/debian wheezy-libjpeg62-compat main"
        ;;
    *)
        APPREPOSITORYLINKBACKUP=''
        ;;
esac
