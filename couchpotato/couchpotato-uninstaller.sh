#!/bin/bash
# Script Name: AtoMiC CouchPotato Uninstaller
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

echo -e $GREEN'AtoMiC CouchPotato Uninstaller Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->CouchPotato uninstallation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to uninstall any relevant files/packages.'
echo -e '5. Best used to uninstall CouchPotato installed using AtoMiC ToolKit or '$CYAN'www.htpcBeginner.com'$ENDCOLOR' guides.'

source $2/inc/consent.sh

echo -n 'Type the username of the user you installed CouchPotato as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '

source $2/inc/usercheck.sh

echo -e $YELLOW'--->Stopping CouchPotato...'$ENDCOLOR
sudo /etc/init.d/couchpotato stop >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Removing CouchPotato Autostart scripts...'$ENDCOLOR
sudo update-rc.d -f couchpotato remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
sudo rm /etc/default/couchpotato || { echo -e $RED'Warning! Removing default script failed.'$ENDCOLOR ; }
sudo rm /etc/init.d/couchpotato || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }

echo
sleep 1

read -p 'Do you want to keep CouchPotato installation files as a backup or for reinstalling later? Type y/Y to keep files or any other key to delete files, and press [ENTER] : '
FILEDEL=${REPLY,,}

if [ "$FILEDEL" != "y" ] 
then
	echo
	echo -e $YELLOW'--->Deleting CouchPotato files from '$CYAN'/home/'$UNAME'/.couchpotato'$YELLOW'...'$ENDCOLOR
	sudo rm -r /home/$UNAME/.couchpotato
else
	echo
	echo -e $YELLOW'--->Keeping CouchPotato files in '$CYAN'/home/'$UNAME'/.couchpotato'$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

echo -e $GREEN'--->All done.'$ENDCOLOR
echo -e 'CouchPotato Uninstalled.'

source $2/inc/thankyou.sh
source $2/inc/exit.sh
