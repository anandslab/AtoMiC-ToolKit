#!/bin/bash

# Script Name: AtoMiC FFmpeg Version Check
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-version-check.sh"
FFMPEGVERSION=$(curl -sL https://johnvansickle.com/ffmpeg | grep release: | sed 's/release://g' | xargs)
echo "Available Version: $FFMPEGVERSION"

if ! checkappversion "FFMPEG" "$FFMPEGVERSION" ; then
    exit 1
fi
