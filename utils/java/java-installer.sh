#!/bin/bash
# Script Name: AtoMiC Java Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${GREEN}AtoMiC Java 8 Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/utils/java/java-constants.sh"
source "$SCRIPTPATH/utils/java/java-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
sudo echo -e oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
source "$SCRIPTPATH/inc/app-install-deps.sh"
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
