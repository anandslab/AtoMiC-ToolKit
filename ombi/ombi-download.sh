#!/bin/bash
# Script Name: AtoMiC Ombi Installer
# Author: mgiljum
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo

ARCH=$(uname -m)
ARCHSHORT=${ARCH:0:3}
if [[ $ARCHSHORT = 'arm' ]]; then
    filename='linux-arm.tar.gz'
else
    filename='linux.tar.gz'
fi

echo -e "$YELLOW--->Latest Github File Found...$ENDCOLOR"
OUTPUT="$(curl -s https://api.github.com/repos/tidusjar/Ombi/releases | \
grep browser_download_url | \
grep $filename | \
head -n 1 | \
cut -d '"' -f 4)"
echo "${OUTPUT}"
echo
echo -e "$YELLOW--->Downloading and extracting files...$ENDCOLOR"
sudo curl -L "${OUTPUT}" | tar -xzf - -C "$APPPATH"
