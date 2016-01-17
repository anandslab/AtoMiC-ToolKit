#!/bin/bash
# Script Name: AtoMiC ToolKit Updater
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $1 != *"setup.sh"* ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi

source $2/inc/commons.sh
source $2/inc/header.sh

echo -e $GREEN'AtoMiC ToolKit Updater'$ENDCOLOR
echo 

read -p 'This will overwrite any manual changes you made to the script. Type y/Y and press [ENTER] to continue with update or any other key to exit: '

source $2/inc/consent.sh

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install git-core

echo
sleep 1

echo -e $YELLOW'--->Stashing any local changes...'$ENDCOLOR
#git config user.email “atomic@htpcbeginner.com”
#git config user.name “AtoMiCUser”
#git stash
#git stash clear

echo 
sleep 1

echo -e $YELLOW'--->Updating AtoMiC ToolKit...'$ENDCOLOR
git fetch --all
git reset --hard origin/master

echo
source $2/inc/exit.sh
