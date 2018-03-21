#!/bin/bash
# Script Name: AtoMiC Aria2 Download

echo
ARCHDETECT=$(uname -m)
if [[ ${ARCHDETECT:0:3} = 'arm' ]]; then
    ARCHTYPE='arm'
elif [[ ${ARCHDETECT:0:1} = 'i' ]]; then
    ARCHTYPE='32bit'
else
    ARCHTYPE='64bit'
fi

cd "$(mktemp -d)" || exit
echo -e "$YELLOW--->Getting Download File...$ENDCOLOR"
URL="$(curl -s https://api.github.com/repos/q3aql/aria2-static-builds/releases | \
grep browser_download_url | \
grep $ARCHTYPE | \
head -n 1 | \
cut -d '"' -f 4)"

if [[ -z $URL ]]; then
    echo -e "${RED}Failed to get dowload URL.$ENDCOLOR" ; exit 1;
fi

AVAILABLEARIA2=$(echo $(basename $URL) | grep -oP '(?<=aria2-).*(?=-linux)')
echo -e "${CYAN}Available Version: ${AVAILABLEARIA2}$ENDCOLOR"
CURRENTARIA2=$(dpkg -s aria2 | grep Version | grep -oP '(?<= 1:).*(?=-1)')
echo -e "${CYAN}Installed Version: $CURRENTARIA2$ENDCOLOR"

vercomp "$AVAILABLEARIA2" "$CURRENTARIA2"
if [[ $? = 1 ]]; then
    echo
    echo "Downloading $(basename $URL)"
    if wget -qO- --show-progress "${URL}" | tar -jx --strip-components=1 || \
            { echo -e "${RED}Failed to download File.$ENDCOLOR" ; exit 1; }; then
        
        echo -e "$YELLOW--->Remove previous version...$ENDCOLOR"
        sudo apt-get remove aria2 -y
        echo
        echo 'Starting Build'
        sudo checkinstall -y --pkgversion="1:${AVAILABLEARIA2}" --pkgname='aria2' --pakdir='/var/cache/apt/archives'

        echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
    fi
else
    echo -e "${GREEN}$APPTITLE update not required.$ENDCOLOR"
fi
echo
rm -r "$(pwd)"
cd "$SCRIPTPATH" || exit
