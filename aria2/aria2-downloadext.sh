#!/bin/bash
# Script Name: AtoMiC Ombi Download Get Extension

echo
ARCHDETECT=$(uname -m)
if [[ ${ARCHDETECT:0:3} = 'arm' ]]; then
    APPDOWNLOADEXT='arm'
elif [[ ${ARCHDETECT:0:1} = 'i' ]]; then
    APPDOWNLOADEXT='32bit'
else
    APPDOWNLOADEXT='64bit'
fi
