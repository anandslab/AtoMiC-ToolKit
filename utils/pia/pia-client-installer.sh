#!/bin/bash
# Script Name: AtoMiC Private Internet Access Client Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
# https://installers.privateinternetaccess.com/download

echo
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"

source "$SCRIPTPATH/utils/pia/pia-client-kill.sh"

TEMPDIR="$(mktemp -d)"
cd "$TEMPDIR" || exit
chown "$UNAME":"$UGROUP" "$TEMPDIR" || { echo -e "${RED}Chown on $TEMPDIR failed.$ENDCOLOR"; exit 1; }
chmod -R 775 "$TEMPDIR" || { echo -e "${RED}Chmod on $TEMPDIR failed.$ENDCOLOR"; exit 1; }
chmod -R g+s "$TEMPDIR" || { echo -e "${RED}Chmod on $TEMPDIR failed.$ENDCOLOR"; exit 1; }

echo
URL=$(curl -s https://www.privateinternetaccess.com/pages/downloads | \
    grep 'linux.tar.gz'| grep -o -P '(?<=href=).*(?=>)' | \
    sed "s/['\"]//g" | sort -r | head -n 1)

echo -e "${YELLOW}Downloading from: $URL$ENDCOLOR"
curl "${URL}" | tar -xz
SCRIPTNAME=$(ls)
chmod +x "$SCRIPTNAME"
source "$SCRIPTPATH/inc/app-folders-create.sh"
echo
sudo -u "$UNAME" bash "$SCRIPTNAME"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
