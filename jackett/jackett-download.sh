#!/bin/bash
# Script Name: AtoMiC Jackett Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "$YELLOW--->Latest File Found...$ENDCOLOR"
if "$SCRIPTPATH/jackett/jackett-version-handler.sh"; then
    OUTPUT="$(curl -s https://api.github.com/repos/jackett/jackett/releases | \
    grep browser_download_url | \
    head -n 1 | \
    cut -d '"' -f 4)"
    echo "${OUTPUT}"
    echo
    echo -e "$YELLOW--->Downloading and extracting files...$ENDCOLOR"
    sudo curl -L "${OUTPUT}" | tar -xzf - -C "$APPPATH" --strip-components=1
fi
