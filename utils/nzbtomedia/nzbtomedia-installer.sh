#!/bin/bash
# Script Name: AtoMiC nzbToMedia Installer

echo
source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-constants.sh"
if [[ ! -d $APPPATH ]]; then
    echo
    echo -e "${GREEN}AtoMiC nzbToMedia Installer Script$ENDCOLOR"
    source "$SCRIPTPATH/inc/pkgupdate.sh"
    source "$SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh"
    source "$SCRIPTPATH/utils/unrar/unrar-installer.sh"
    source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-constants.sh"
    source "$SCRIPTPATH/inc/app-git-download.sh"
    echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
else
    source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-update.sh"
fi
