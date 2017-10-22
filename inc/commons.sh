#!/bin/bash
# shellcheck disable=SC2034
YELLOW='\e[33m'
RED='\e[31m'
ENDCOLOR='\033[0m'
CYAN='\e[34m'
GREEN='\e[32m'
BACKTITLE='We have worked several hundred hours on AtoMiC ToolKit. Please visit www.htpcbeginner.com and share or follow us to show your support.'
LINES=26
COLUMNS=78
NETLINES=16

function pause(){
   read -p "$*"
}

function IsSystemdSupported(){
    if command -v systemctl > /dev/null && systemctl | grep -q '\-\.mount'; then
        return 0
    else
        return 1
    fi
}
