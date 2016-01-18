#!/bin/bash
# Script Name: AtoMiC ToolKit Default Credentials
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
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN'AtoMiC Default Credientials'$ENDCOLOR
echo 

echo -e $YELLOW'Sick Beard'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 8081'$ENDCOLOR
echo -e $CYAN'Default Username:'$RED' none'$ENDCOLOR
echo -e $CYAN'Default Password:'$RED' none'$ENDCOLOR

echo 

echo -e $YELLOW'SickRage'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 8081'$ENDCOLOR
echo -e $CYAN'Default Username:'$RED' none'$ENDCOLOR
echo -e $CYAN'Default Password:'$RED' none'$ENDCOLOR

echo 

echo -e $YELLOW'SickGear'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 8081'$ENDCOLOR
echo -e $CYAN'Default Username:'$RED' none'$ENDCOLOR
echo -e $CYAN'Default Password:'$RED' none'$ENDCOLOR

echo 

echo -e $YELLOW'Sonarr'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 8989'$ENDCOLOR
echo -e $CYAN'Default Username:'$RED' none'$ENDCOLOR
echo -e $CYAN'Default Password:'$RED' none'$ENDCOLOR

echo 
pause 'Press [Enter] for page 2...'
echo 

echo -e $YELLOW'CouchPotato'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 5050'$ENDCOLOR
echo -e $CYAN'Default Username:'$RED' none'$ENDCOLOR
echo -e $CYAN'Default Password:'$RED' none'$ENDCOLOR

echo 

echo -e $YELLOW'Transmission'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 9091'$ENDCOLOR
echo -e $CYAN'Default Username:'$GREEN' transmission'$ENDCOLOR
echo -e $CYAN'Default Password:'$GREEN' transmission'$ENDCOLOR

echo 

echo -e $YELLOW'qBittorrent'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 8086'$ENDCOLOR
echo -e $CYAN'Default Username:'$GREEN' admin'$ENDCOLOR
echo -e $CYAN'Default Password:'$GREEN' adminadmin'$ENDCOLOR

echo 

echo -e $YELLOW'SABNzbd'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 8080'$ENDCOLOR
echo -e $CYAN'Default Username:'$RED' none'$ENDCOLOR
echo -e $CYAN'Default Password:'$RED' none'$ENDCOLOR

echo 
pause 'Press [Enter] for page 3...'
echo 

echo -e $YELLOW'HTPC Manager'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 8085'$ENDCOLOR
echo -e $CYAN'Default Username:'$RED' none'$ENDCOLOR
echo -e $CYAN'Default Password:'$RED' none'$ENDCOLOR

echo 

echo -e $YELLOW'Headphones'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 8181'$ENDCOLOR
echo -e $CYAN'Default Username:'$RED' none'$ENDCOLOR
echo -e $CYAN'Default Password:'$RED' none'$ENDCOLOR

echo 

echo -e $YELLOW'Mylar'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 8090'$ENDCOLOR
echo -e $CYAN'Default Username:'$RED' none'$ENDCOLOR
echo -e $CYAN'Default Password:'$RED' none'$ENDCOLOR

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
