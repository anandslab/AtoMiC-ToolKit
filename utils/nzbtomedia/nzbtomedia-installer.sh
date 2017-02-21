#!/bin/bash
# Script Name: AtoMiC nzbToMedia Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo
echo -e $GREEN"AtoMiC nzbToMedia Installer Script"$ENDCOLOR

source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh
source $SCRIPTPATH/utils/nzbtomedia/nzbtomedia-constants.sh
source $SCRIPTPATH/inc/app-install-deps.sh
source $SCRIPTPATH/inc/app-move-previous.sh
source $SCRIPTPATH/inc/app-git-download.sh
source $SCRIPTPATH/inc/app-git-stash.sh
source $SCRIPTPATH/inc/app-set-permissions.sh
source $SCRIPTPATH/inc/app-constant-reset.sh
echo
echo -e $GREEN"---> nzbToMedia installation complete."$ENDCOLOR
