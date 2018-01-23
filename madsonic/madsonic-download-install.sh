#!/bin/bash
# Script Name: AtoMiC Madsonic Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

FILE=$(curl -s http://beta.madsonic.org/pages/download62.jsp | grep -o '".*"' | grep -o '.*\.deb' | grep -oP '(?<=target=).*' | sed 's/"//g' | head -1)
echo
echo -e "${YELLOW}File Found: ${FILE}$ENDCOLOR"
SHORTVERSION=${FILE:18:3}
URL="http://madsonic.org/download/$SHORTVERSION/$FILE"
echo -e $YELLOW"URL Found: "$URL$ENDCOLOR

if ! [[ -f "/var/cache/apt/archives/$FILE" ]]; then
    wget $URL -P '/var/cache/apt/archives'
else
    echo "Latest File already found in /var/cache/apt/archives/$FILE"
fi
sudo dpkg -i '/var/cache/apt/archives'/$FILE

cd $SCRIPTPATH
