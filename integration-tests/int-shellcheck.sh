#!/bin/bash
# Script Name: AtoMiC Integration Test shellcheck check
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

find . -name '*.sh' -print0 | xargs -0 shellcheck -e SC1017 -e SC1090 -e SC2034 -e SC2086 -e SC2215

SCRIPTPATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

numprocesses=$(grep -r '^# shellcheck disable' "$SCRIPTPATH" | grep -c 'shellcheck disable')

if [[ $numprocesses -gt 0 ]] ; then
    echo "shellcheck disable warnings found"
    grep -rn "$SCRIPTPATH" -e '^# shellcheck disable'
    exit 1
fi
