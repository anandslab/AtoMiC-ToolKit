#!/bin/bash

# Script Name: AtoMiC RVM Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${GREEN}AtoMiC RVM Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/utils/rvm/rvm-constants.sh"
source "$SCRIPTPATH/inc/app-keys-add.sh"
su -c "\curl -sSL https://get.rvm.io | bash -s stable --ruby" $UNAME
source /home/$UNAME/.rvm/scripts/rvm

if [[ -f .bashrc ]]; then
    echo "Set Ruby to use default version in .bashrc file"

    grep -q -F '[[ -s "/home/$UNAME/.rvm/scripts/rvm" ]] && source "/home/$UNAME/.rvm/scripts/rvm"' .bashrc ||
    echo '[[ -s "/home/$UNAME/.rvm/scripts/rvm" ]] && source "/home/$UNAME/.rvm/scripts/rvm"' >> .bashrc
fi

VERSION=$(ruby -v | grep -o -P '(?<=ruby ).*(?=p)')
rvm --default use $VERSION
echo "Set Ruby to use default version $VERSION"

echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
