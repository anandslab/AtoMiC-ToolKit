#!/bin/bash
# Script Name: AtoMiC ToolKit
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

sudo apt-get -y install dos2unix >/dev/null 2>&1
dos2unix * >/dev/null 2>&1
sudo chmod -R 775 * >/dev/null 2>&1

function pause(){
   read -p "$*"
}

if [ "$EUID" -ne 0 ]
  then 
  echo
  echo -e $RED'Please run as root using the command: '$ENDCOLOR'sudo ./setup.sh'
  echo
  exit 0
fi

clear
echo 
echo -e $RED
echo -e " ┬ ┬┬ ┬┬ ┬ ┬ ┬┌┬┐┌─┐┌─┐┌┐ ┌─┐┌─┐┬┌┐┌┌┐┌┌─┐┬─┐ ┌─┐┌─┐┌┬┐"
echo -e " │││││││││ ├─┤ │ ├─┘│  ├┴┐├┤ │ ┬│││││││├┤ ├┬┘ │  │ ││││"
echo -e " └┴┘└┴┘└┴┘o┴ ┴ ┴ ┴  └─┘└─┘└─┘└─┘┴┘└┘┘└┘└─┘┴└─o└─┘└─┘┴ ┴"
echo -e $CYAN
echo -e "                __  ___             "
echo -e "  /\ |_ _ |\/|./     | _  _ ||_/.|_ "
echo -e " /--\|_(_)|  ||\__   |(_)(_)|| \||_ "
echo
echo -e $GREEN'AtoMiC ToolKit HTPC / Home Server Setup Script'$ENDCOLOR
echo 
echo -e 'NOTE: At this point, this script has been confirmed to work only on Ubuntu variants.'
echo
echo -e $YELLOW'00. '$ENDCOLOR'Check and Update AtoMiC ToolKit'
echo -e $YELLOW'01. '$ENDCOLOR'Install .bash_aliases HTPC / Home Server administration'
echo -e $YELLOW'10. '$ENDCOLOR'Sick Beard - Install'
echo -e $YELLOW'11. '$ENDCOLOR'Sick Beard - Uninstall'
echo -e $YELLOW'12. '$ENDCOLOR'Sick Beard - Backup Database and Settings'
echo -e $YELLOW'13. '$ENDCOLOR'Sick Beard - Restore Database and Settings'
echo -e $YELLOW'20. '$ENDCOLOR'SickRage - Install'
echo -e $YELLOW'21. '$ENDCOLOR'SickRage - Uninstall'
echo -e $YELLOW'22. '$ENDCOLOR'SickRage - Backup Database and Settings'
echo -e $YELLOW'23. '$ENDCOLOR'SickRage - Restore Database and Settings'
echo -e $YELLOW'30. '$ENDCOLOR'SickGear - Install'
echo -e $YELLOW'31. '$ENDCOLOR'SickGear - Uninstall'
echo -e $YELLOW'32. '$ENDCOLOR'SickGear - Backup Database and Settings'
echo -e $YELLOW'33. '$ENDCOLOR'SickGear - Restore Database and Settings'
echo -e $YELLOW'40. '$ENDCOLOR'Sonarr (NzbDrone) - Install'
echo -e $YELLOW'41. '$ENDCOLOR'Sonarr (NzbDrone) - Uninstall'
echo -e $YELLOW'50. '$ENDCOLOR'CouchPotato - Install'
echo -e $YELLOW'51. '$ENDCOLOR'CouchPotato - Uninstall'
echo -e $YELLOW'52. '$ENDCOLOR'CouchPotato - Backup Database and Settings'
echo -e $YELLOW'53. '$ENDCOLOR'CouchPotato - Restore Database and Settings'
echo -e $YELLOW'60. '$ENDCOLOR'Transmission - Install (WebUI only, no Desktop GUI)'
echo -e $YELLOW'61. '$ENDCOLOR'Transmission - Uninstall'
echo -e $YELLOW'65. '$ENDCOLOR'qBittorrent - Install (WebUI only, no Desktop GUI)'
echo -e $YELLOW'66. '$ENDCOLOR'qBittorrent - Uninstall'
echo -e $YELLOW'70. '$ENDCOLOR'SABNzbd - Install'
echo -e $YELLOW'71. '$ENDCOLOR'SABNzbd - Uninstall'
echo -e $YELLOW'90. '$ENDCOLOR'HTPC Manager - Install'
echo -e $YELLOW'91. '$ENDCOLOR'HTPC Manager - Uninstall'
echo -e $YELLOW'98. '$ENDCOLOR'See default port numbers, usernames, and passwords'
echo -e $YELLOW'99. '$ENDCOLOR'Exit'

echo
echo -n "What would you like to do [00-99]: "
read option
case $option in
	0 | 00)
		echo
	        	echo -e $YELLOW'--->Checking for updates...'$ENDCOLOR
		git pull
		echo
		pause 'Press [Enter] to restart and continue...'
		cd $SCRIPTPATH
		sudo ./setup.sh
		exit 0
		;;
	1 | 01)
         	sudo ./bash_aliases-installer.sh
		;;
			
    10)
		sudo ./sickbeard-installer.sh
		;;
    11) 
    		sudo ./sickbeard-uninstaller.sh
    		;;
    12)
    		sudo ./sickbeard-backup.sh
    		;;
	13)
    		sudo ./sickbeard-restore.sh
    		;;
    	
    20)
    		sudo ./sickrage-installer.sh
    		;;
    21)
    		sudo ./sickrage-uninstaller.sh
    		;;
    22)
    		sudo ./sickrage-backup.sh
    		;;
    23)
    		sudo ./sickrage-restore.sh
    		;;
			
    30)
    		sudo ./sickgear-installer.sh
    		;;
    31)
    		sudo ./sickgear-uninstaller.sh
    		;;
    32)
    		sudo ./sickgear-backup.sh
    		;;
    33)
    		sudo ./sickgear-restore.sh
    		;;
			
    40)
    		sudo ./sonarr-installer.sh
    		;;
    41)
    		sudo ./sonarr-uninstaller.sh
    		;;
			
    50)
    		sudo ./couchpotato-installer.sh
    		;;
    51) 
    		sudo ./couchpotato-uninstaller.sh
    		;;
    52)
    		sudo ./couchpotato-backup.sh
    		;;
    53) 
    		sudo ./couchpotato-restore.sh
    		;;
			
    60)
    		sudo ./transmission-webui-installer.sh
    		;;
    61)
    		sudo ./transmission-webui-uninstaller.sh
    		;;
    		
	65)
			sudo ./qbittorrent-installer.sh
    		;;
    66)
    		sudo ./qbittorrent-uninstaller.sh
    		;;
    		
	70)
    		sudo ./sabnzbd-installer.sh
    		;;
	71)
    		sudo ./sabnzbd-uninstaller.sh
    		;;
    
	90)
    		sudo ./htpcmanager-installer.sh
    		;;
	91)
    		sudo ./htpcmanager-uninstaller.sh
    		;;
			
    	98)
    		sudo ./default-credentials.sh
    	;;
    	99)
		echo 'Exiting...'
		echo
		echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
		echo -e $YELLOW'Thank you for using the AtoMiC ToolKit from www.htpcBeginner.com.'$ENDCOLOR 
		echo
		sleep 2
		#URL=http://www.htpcbeginner.com/atomic-thanks
		#[[ -x $BROWSER ]] && exec "$BROWSER" "$URL"
		#path=$(which xdg-open || which gnome-open) && exec "$path" "$URL" >/dev/null 2>&1
		;;
    	*)
        	echo -e $RED'Invalid Option'$ENDCOLOR
		ScriptLoc=$(readlink -f "$0")
		sleep 1
		exec $ScriptLoc
esac
