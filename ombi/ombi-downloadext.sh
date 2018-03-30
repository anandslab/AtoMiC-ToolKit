#!/bin/bash
# Script Name: AtoMiC Ombi Download Get Extension

echo
ARCH=$(uname -m)
ARCHSHORT=${ARCH:0:3}
if [[ $ARCHSHORT = 'arm' ]]; then
    APPDOWNLOADEXT='linux-arm.tar.gz'
else
    APPDOWNLOADEXT='linux.tar.gz'
fi
