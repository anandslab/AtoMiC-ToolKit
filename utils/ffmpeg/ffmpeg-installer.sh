#!/bin/bash

# Script Name: AtoMiC FFmpeg Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${GREEN}AtoMiC FFmpeg Installer Script$ENDCOLOR"

ARCHDETECT=$(uname -m)
ARCH=''
TYPE=''
if [ "${ARCHDETECT:0:4}" = "armv" ]; then
    ARCH='release-armhf-32bit'
    TYPE='releases'
elif [ "$ARCHDETECT" = 'armel' ]; then
    ARCH='release-armel-32bit'
    TYPE='releases'
elif [ "${ARCHDETECT:0:1}" = 'i' ]; then
    ARCH='git-32bit'
    TYPE='builds'
elif [ "$ARCHDETECT" = 'x86_64' ]; then
    ARCH='git-64bit'
    TYPE='builds'
fi

if [[ -n $ARCH ]]; then
    if "$SCRIPTPATH/utils/ffmpeg/ffmpeg-version-handler.sh"; then
        echo
        echo -e "$YELLOW--->Downloading and extracting files...$ENDCOLOR"
        URL=https://johnvansickle.com/ffmpeg/$TYPE/ffmpeg-$ARCH-static.tar.xz
        echo $URL
        TMP_DIR=$( mktemp -d )
        curl $URL | sudo tar Jx -C "$TMP_DIR" --strip-components=1
        mv "$TMP_DIR"/ff* /usr/bin
        rm -rf "$TMP_DIR"
        echo -e "${GREEN}---> FFmpeg installation complete.$ENDCOLOR"
    fi
else
    echo -e "$RED--->Unable to detect architecture to install FFmpeg$ENDCOLOR"
fi

source "$SCRIPTPATH/inc/app-constant-reset.sh"
