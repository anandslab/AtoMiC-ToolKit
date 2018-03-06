#!/bin/bash
# Script Name: AtoMiC Integration Test shellcheck check
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

SCRIPTPATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
source "$SCRIPTPATH/inc/commons.sh"

shellcheck -V

# -e SC1017 -e SC1090 -e SC2034 -e SC2086 -e SC2215
NoShellCheckCodeWarningsFound=$(find . -name '*.sh' -print0 | xargs -0 shellcheck)
if [[ -n $NoShellCheckCodeWarningsFound ]] ; then
    echo -e "${RED}Shellcheck warnings found$ENDCOLOR"
    find . -name '*.sh' -print0 | xargs -0 shellcheck
    exit 1
fi

# Search for ShellCheck Warnings in all the scripts and fail if it finds any
NoSCDISABLED=$(grep -r '^# shellcheck disable' "$SCRIPTPATH" | grep -c 'shellcheck disable')
if [[ $NoSCDISABLED -gt 0 ]] ; then
    echo -e "${RED}Shellcheck disable warnings found$ENDCOLOR"
    grep -rn "$SCRIPTPATH" -e '^# shellcheck disable'
    exit 1
fi
