#!/bin/bash
# Script Name: AtoMiC nzbToMedia Updater
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source $SCRIPTPATH/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN"AtoMiC $APPTITLE Update Script"$ENDCOLOR
source $SCRIPTPATH/utils/nzbtomedia/nzbtomedia-constants.sh
source $SCRIPTPATH/inc/app-folder-check.sh
source $SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh
source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-install-deps.sh
source $SCRIPTPATH/inc/app-git-stash.sh
source $SCRIPTPATH/inc/app-git-update.sh
source $SCRIPTPATH/inc/app-constant-reset.sh
echo
echo -e $GREEN"AtoMiC $APPTITLE Update Complete"$ENDCOLOR
