#!/bin/bash
# Script Name: AtoMiC ToolKit Default Credentials
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#
# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
YELLOW='\e[93m'
RED='\e[91m'
ENDCOLOR='\033[0m'
CYAN='\e[96m'
GREEN='\e[92m'
SCRIPTPATH=$(pwd)
function pause(){
read -p "$*"
}
clear
echo 
echo -e $RED
echo -e " ┬ ┬┬ ┬┬ ┬ ┬ ┬┌┬┐┌─┐┌─┐┌┐ ┌─┐┌─┐┬┌┐┌┌┐┌┌─┐┬─┐ ┌─┐┌─┐┌┬┐"
echo -e " │││││││││ ├─┤ │ ├─┘│  ├┴┐├┤ │ ┬│││││││├┤ ├┬┘ │  │ ││││"
echo -e " └┴┘└┴┘└┴┘o┴ ┴ ┴ ┴  └─┘└─┘└─┘└─┘┴┘└┘┘└┘└─┘┴└─o└─┘└─┘┴ ┴"
echo -e $CYAN
echo -e "                __     __           "
echo -e "  /\ |_ _ |\/|./      (_  _ _. _ |_ "
echo -e " /--\|_(_)|  ||\__    __)(_| ||_)|_ "
echo -e "                              |     "
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
echo -e $CYAN'Port:'$GREEN' 8085'$ENDCOLOR
echo -e $CYAN'Default Username:'$GREEN' admin'$ENDCOLOR
echo -e $CYAN'Default Password:'$GREEN' adminadmin'$ENDCOLOR

echo 

echo -e $YELLOW'SABNzbd'$ENDCOLOR
echo -e $CYAN'Port:'$GREEN' 8080'$ENDCOLOR
echo -e $CYAN'Default Username:'$RED' none'$ENDCOLOR
echo -e $CYAN'Default Password:'$RED' none'$ENDCOLOR

echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC .bash_aliases Install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
exit 0
