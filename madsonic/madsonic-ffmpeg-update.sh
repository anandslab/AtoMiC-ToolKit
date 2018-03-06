#!/bin/bash

# Script Name: AtoMiC Madsonic ffmpeg update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh"
echo
echo -e "${YELLOW}--->Copying ffmpeg file to /var/madsonic/transcode/...$ENDCOLOR"
if command cp -rf /usr/bin/ffmpeg /var/madsonic/transcode/; then
    echo 'ffmpeg files copied to /var/madsonic/transcode/'
fi
source "$SCRIPTPATH/madsonic/madsonic-constants.sh"
