#!/bin/bash
# Script Name: AtoMiC Subsonic Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

cd "$(mktemp -d)" || exit

FILE=$(curl -s http://www.subsonic.org/pages/download.jsp | grep -o '".*"' | grep -o 'subsonic.*\.deb' | sed 's/"//g' | head -1)
echo
echo -e "${YELLOW}File Found: ${FILE}$ENDCOLOR"
URL="https://s3-eu-west-1.amazonaws.com/subsonic-public/download/${FILE}"
echo -e "${YELLOW}URL Found: $URL$ENDCOLOR"

if ! [[ -f "/var/cache/apt/archives/$FILE" ]]; then
    wget $URL -P '/var/cache/apt/archives'
else
    echo "Latest File already found in /var/cache/apt/archives/$FILE"
fi
sudo dpkg -i '/var/cache/apt/archives'/$FILE

cd $SCRIPTPATH || exit
