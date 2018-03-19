#!/bin/bash
# Script Name: AtoMiC Aria2 Download

echo
cd "$(mktemp -d)" || exit
echo -e "$YELLOW--->Latest File Found...$ENDCOLOR"
URL="$(curl -s https://api.github.com/repos/aria2/aria2/releases | \
grep browser_download_url | \
grep tar.gz | \
head -n 1 | \
cut -d '"' -f 4)"

VERSION=$(echo $URL | grep -oP '(?<=aria2-).*(?=.tar)')
echo -e "${YELLOW}Available Version: 1:${VERSION}-1$ENDCOLOR"
CURRENTARIA2=$(dpkg -s aria2 | grep Version | cut -d " " -f2-)
echo -e "${YELLOW}Installed Version: $CURRENTARIA2$ENDCOLOR"

if [[ $CURRENTARIA2 != "1:${VERSION}-1" ]] ; then
    echo
    sudo curl "${URL}" | tar -xz
    cd "aria2-$VERSION" || exit
    echo
    sudo apt-get remove aria2 -y
    echo 'Starting Build'
    sudo make
    sudo checkinstall -y --pkgversion="1:${VERSION}" --pakdir='/var/cache/apt/archives'

    echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
else
    echo -e "${GREEN}$APPTITLE update not required.$ENDCOLOR"
fi

rm -r "$(pwd)"
cd "$SCRIPTPATH" || exit
