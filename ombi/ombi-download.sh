#!/bin/bash
# Script Name: AtoMiC Ombi Downloader

echo
ARCH=$(uname -m)
ARCHSHORT=${ARCH:0:3}
if [[ $ARCHSHORT = 'arm' ]]; then
    FILENAME='linux-arm.tar.gz'
else
    FILENAME='linux.tar.gz'
fi

OUTPUT="$(curl -s https://api.github.com/repos/tidusjar/Ombi/releases | \
grep browser_download_url | \
grep $FILENAME | \
head -n 1 | \
cut -d '"' -f 4)"
echo "${OUTPUT}"
echo
echo -e "$YELLOW--->Downloading and extracting Latest Release File...$ENDCOLOR"
sudo curl -L "${OUTPUT}" | tar -xzf - -C "$APPPATH"
