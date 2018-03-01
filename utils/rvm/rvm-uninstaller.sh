#!/bin/bash

# Script Name: AtoMiC RVM Uninstaller
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo -e "${GREEN}AtoMiC RVM Installer Script$ENDCOLOR"
source /home/$UNAME/.rvm/scripts/rvm
source "$SCRIPTPATH/inc/app-keys-remove.sh"
rvm --default use system
echo "Set Ruby to use system version $VERSION"
rvm remove ruby
echo -e "${GREEN}---> $APPTITLE uninstallation complete.$ENDCOLOR"
