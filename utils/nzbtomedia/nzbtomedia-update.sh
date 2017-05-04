#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC nzbToMedia Updater
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-constants.sh"
source "$SCRIPTPATH/inc/app-folder-check.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh"
source "$SCRIPTPATH/utils/unrar/unrar-installer.sh"
source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-constants.sh"
source "$SCRIPTPATH/inc/app-git-update.sh"
echo -e "${GREEN}---> nzbToMedia update complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
