#!/bin/bash

# Script Name: AtoMiC NetData Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
bash <(curl -Ss https://my-netdata.io/kickstart.sh) --dont-wait
cp /usr/src/netdata.git/netdata-uninstaller.sh "$APPPATH"
cp /usr/src/netdata.git/netdata-updater.sh "$APPPATH"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
