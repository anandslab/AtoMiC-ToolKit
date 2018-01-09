#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC FFmpeg Version Check
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

FFMPEGVERSION=$(curl -sL https://johnvansickle.com/ffmpeg | grep release: | sed 's/release://g' | xargs)
echo "Available Version: $FFMPEGVERSION"

if ! "$SCRIPTPATH/inc/app-version-check.sh" "FFMPEG" "$FFMPEGVERSION" ; then
    exit 1
fi
