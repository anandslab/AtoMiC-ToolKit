#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Node.js Repo config Script
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)


CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'precise'|'wheezy')
        curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
        ;;
    *)
        curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
        ;;
esac
