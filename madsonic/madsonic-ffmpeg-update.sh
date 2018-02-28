#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Madsonic ffmpeg update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)


source "$SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh"
echo
echo -e "${YELLOW}--->Copying ffmpeg file to /var/madsonic/transcode/...$ENDCOLOR"
yes | cp -rf /usr/bin/ffmpeg /var/madsonic/transcode/
source "$SCRIPTPATH/madsonic/madsonic-constants.sh"
