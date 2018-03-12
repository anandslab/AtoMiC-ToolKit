#!/bin/bash
# Script Name: AtoMiC Node.js Repo config Script

CODENAME=$(lsb_release -c -s)

case "$CODENAME" in
    'precise'|'wheezy')
        curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
        ;;
    *)
        curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
        ;;
esac
