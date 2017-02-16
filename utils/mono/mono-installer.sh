#!/bin/bash
# Script Name: AtoMiC Mono Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e $GREEN"AtoMiC Mono Installer Script"$ENDCOLOR
source $SCRIPTPATH/utils/mono/mono-constants.sh
source $SCRIPTPATH/utils/mono/mono-repository-configurator.sh
source $SCRIPTPATH/inc/app-repository-add.sh
source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-install.sh
source $SCRIPTPATH/inc/app-install-deps.sh
source $SCRIPTPATH/inc/app-constant-reset.sh
echo
echo -e $GREEN"---> Mono installation complete."$ENDCOLOR
