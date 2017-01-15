#!/bin/bash
# Script Name: AtoMiC ToolKit Updater
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
source $SCRIPTPATH/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN'AtoMiC ToolKit Updater'$ENDCOLOR

echo 

echo -e $GREEN'This will overwrite any manual changes you made to the script.'$ENDCOLOR
read -p 'Type y/Y and press [ENTER] to continue with update or any other key to exit: '
RESP=${REPLY,,}

echo 
    
if [ "$RESP" == "y" ]
then
	source $SCRIPTPATH/inc/pkgupdate.sh

	echo
	sleep 1

	echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
	sudo apt-get -y install git

	echo
	sleep 1

	echo -e $YELLOW'--->Stashing any local changes...'$ENDCOLOR
	source $SCRIPTPATH/inc/app-git-stash.sh

	echo 
	sleep 1

	echo -e $YELLOW'--->Updating AtoMiC ToolKit...'$ENDCOLOR
	git fetch --all
	git reset --hard origin/master
	#git reset --hard origin/dev
    echo -e 'AtoMiC ToolKit updated successfully.'
else
	echo -e $RED'AtoMiC ToolKit not updated.'$ENDCOLOR
fi

source $SCRIPTPATH/inc/exit.sh
