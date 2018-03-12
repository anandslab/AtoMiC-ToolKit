#!/bin/bash
# Script Name: AtoMiC FFmpeg Uninstaller

echo -e "${GREEN}AtoMiC FFmpeg Uninstaller Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
echo -e "$YELLOW--->Removing files...$ENDCOLOR"
sudo rm -r /usr/bin/ffmpeg    >/dev/null
sudo rm -r /usr/bin/ffprobe    >/dev/null
sudo rm -r /usr/bin/ffserver    >/dev/null
sudo rm -r /usr/bin/ffmpeg-10bit    >/dev/null

source "$SCRIPTPATH/inc/app-version-check.sh"
removeappversion "FFMPEG"

echo -e "${GREEN}--->All done. FFmpeg uninstalled.$ENDCOLOR"
