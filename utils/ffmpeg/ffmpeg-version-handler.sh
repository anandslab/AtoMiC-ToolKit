#!/bin/bash
# Script Name: AtoMiC FFmpeg Version Check

source "$SCRIPTPATH/inc/app-version-check.sh"
FFMPEGVERSION=$(curl -sL https://johnvansickle.com/ffmpeg | grep release: | sed 's/release://g' | xargs)
echo "Available Version: $FFMPEGVERSION"

if ! checkappversion "FFMPEG" "$FFMPEGVERSION" ; then
    exit 1
fi
