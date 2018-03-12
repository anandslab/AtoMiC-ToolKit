#!/bin/bash
# Script Name: AtoMiC Subsonic ffmpeg update

source "$SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh"
echo
echo -e "${YELLOW}--->Copying ffmpeg file to /var/subsonic/transcode/...$ENDCOLOR"
if command cp -rf /usr/bin/ffmpeg /var/subsonic/transcode/; then
    echo 'ffmpeg files copied to /var/subsonic/transcode/'
fi
source "$SCRIPTPATH/subsonic/subsonic-constants.sh"
