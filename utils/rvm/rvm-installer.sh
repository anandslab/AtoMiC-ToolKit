#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC RVM Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${GREEN}AtoMiC RVM Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/utils/rvm/rvm-constants.sh"
source "$SCRIPTPATH/inc/app-keys-add.sh"
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source /etc/profile.d/rvm.sh
rvm install ruby
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
