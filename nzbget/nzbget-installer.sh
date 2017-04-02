#!/bin/bash
# Script Name: AtoMiC NZBGet Installer
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-move-previous.sh"
echo

wget -O - http://nzbget.net/info/nzbget-version-linux.json | \
sed -n "s/^.*stable-download.*: \"\(.*\)\".*/\1/p" | \
wget --no-check-certificate -i - -O nzbget-latest-bin-linux.run

sh nzbget-latest-bin-linux.run --destdir /opt/nzbget
rm nzbget-latest-bin-linux.run

echo
source "$SCRIPTPATH/inc/app-autostart-configure.sh"

source "$SCRIPTPATH/inc/app-set-permissions.sh"
source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-installer.sh"
source $SCRIPTPATH/nzbget/nzbget-constants.sh
source "$SCRIPTPATH/inc/app-folders-create.sh"

source "$SCRIPTPATH/inc/app-start.sh"
source $SCRIPTPATH/nzbget/nzbget-settings-configurator.sh

source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
