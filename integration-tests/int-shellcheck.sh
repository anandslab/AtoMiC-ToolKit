#!/bin/bash
# Script Name: AtoMiC Integration Test shellcheck check
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

find . -name '*.sh' -print0 | xargs -0 shellcheck -e SC1090 -e SC1117 -e SC2009 -e SC2016 -e SC2034 -e SC2053 -e SC2086 -eSC2128 -e SC2153 -e SC2154 -e SC2181 -e SC2206 -e SC2207 -e SC2216

SCRIPTPATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

numprocesses=$(grep -r '^# shellcheck disable' "$SCRIPTPATH" | grep -c 'shellcheck disable')

if [[ $numprocesses -gt 0 ]] ; then
    echo "shellcheck disable warnings found"
    grep -rn "$SCRIPTPATH" -e '^# shellcheck disable'
    exit 1
fi
