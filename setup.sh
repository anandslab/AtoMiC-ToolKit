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
echo -e $GREEN'AtoMiC ToolKit - HTPC / Home Server Setup Script'$ENDCOLOR
echo 
echo -e 'NOTE: At this point, this script has only been confirmed to work on Ubuntu variants.'
echo
echo -e $YELLOW'00. '$ENDCOLOR'Read README.txt'
echo -e $YELLOW'01. '$ENDCOLOR'Check and Update AtoMiC ToolKit'
echo -e $YELLOW'02. '$ENDCOLOR'Install .bash_aliases HTPC / Home Server administration'
echo -e $YELLOW'05. '$ENDCOLOR'Sick Beard - Install'
echo -e $YELLOW'06. '$ENDCOLOR'Sick Beard - Uninstall'
echo -e $YELLOW'07. '$ENDCOLOR'Sick Beard - Backup Database and Settings'
echo -e $YELLOW'08. '$ENDCOLOR'Sick Beard - Restore Database and Settings'
echo -e $YELLOW'10. '$ENDCOLOR'SickRage - Install'
echo -e $YELLOW'11. '$ENDCOLOR'SickRage - Uninstall'
echo -e $YELLOW'12. '$ENDCOLOR'SickRage - Backup Database and Settings'
echo -e $YELLOW'13. '$ENDCOLOR'SickRage - Restore Database and Settings'
echo -e $YELLOW'15. '$ENDCOLOR'SickGear - Install'
echo -e $YELLOW'16. '$ENDCOLOR'SickGear - Uninstall'
echo -e $YELLOW'17. '$ENDCOLOR'SickGear - Backup Database and Settings'
echo -e $YELLOW'18. '$ENDCOLOR'SickGear - Restore Database and Settings'
echo -e $YELLOW'20. '$ENDCOLOR'Sonarr (NzbDrone) - Install'
echo -e $YELLOW'21. '$ENDCOLOR'Sonarr (NzbDrone) - Uninstall'
echo -e $YELLOW'25. '$ENDCOLOR'CouchPotato - Install'
echo -e $YELLOW'26. '$ENDCOLOR'CouchPotato - Uninstall'
echo -e $YELLOW'27. '$ENDCOLOR'CouchPotato - Backup Database and Settings'
echo -e $YELLOW'28. '$ENDCOLOR'CouchPotato - Restore Database and Settings'
echo -e $YELLOW'30. '$ENDCOLOR'Transmission - Install (WebUI only, no Desktop GUI)'
echo -e $YELLOW'31. '$ENDCOLOR'Transmission - Uninstall'
echo -e $YELLOW'35. '$ENDCOLOR'qBittorrent - Install (WebUI only, no Desktop GUI)'
echo -e $YELLOW'36. '$ENDCOLOR'qBittorrent - Uninstall'
echo -e $YELLOW'40. '$ENDCOLOR'SABNzbd - Install'
echo -e $YELLOW'41. '$ENDCOLOR'SABNzbd - Uninstall'
echo -e $YELLOW'45. '$ENDCOLOR'Headphones - Install'
echo -e $YELLOW'46. '$ENDCOLOR'Headphones - Uninstall'
echo -e $YELLOW'50. '$ENDCOLOR'Mylar - Install'
echo -e $YELLOW'51. '$ENDCOLOR'Mylar - Uninstall'
echo -e $YELLOW'55. '$ENDCOLOR'HTPC Manager - Install'
echo -e $YELLOW'56. '$ENDCOLOR'HTPC Manager - Uninstall'
echo -e $YELLOW'60. '$ENDCOLOR'Plex Server - Install'
echo -e $YELLOW'65. '$ENDCOLOR'Deluge - Install'
echo -e $YELLOW'70. '$ENDCOLOR'MusicBrainz - Install'
echo -e $YELLOW'75. '$ENDCOLOR'Webmin - Install'
echo -e $YELLOW'98. '$ENDCOLOR'See default port numbers, usernames, and passwords'
echo -e $YELLOW'99. '$ENDCOLOR'Exit'

echo
echo -n "What would you like to do [00-99]: "
read option
case $option in
	0 | 00)
		less README.txt
		;;
	1 | 01)
		sudo ./atomic-updater.sh
		;;
	2 | 02)
         	sudo ./bash_aliases-installer.sh
		;;
		
    5 | 05)
		sudo ./sickbeard-installer.sh
		;;
    6 | 06) 
    		sudo ./sickbeard-uninstaller.sh
    		;;
    7 | 07)
    		sudo ./sickbeard-backup.sh
    		;;
	8 | 08)
    		sudo ./sickbeard-restore.sh
    		;;
    	
    10)
    		sudo ./sickrage-installer.sh
    		;;
    11)
    		sudo ./sickrage-uninstaller.sh
    		;;
    12)
    		sudo ./sickrage-backup.sh
    		;;
    13)
    		sudo ./sickrage-restore.sh
    		;;
			
    15)
    		sudo ./sickgear-installer.sh
    		;;
    16)
    		sudo ./sickgear-uninstaller.sh
    		;;
    17)
    		sudo ./sickgear-backup.sh
    		;;
    18)
    		sudo ./sickgear-restore.sh
    		;;
			
    20)
    		sudo ./sonarr-installer.sh
    		;;
    21)
    		sudo ./sonarr-uninstaller.sh
    		;;
			
    25)
    		sudo ./couchpotato-installer.sh
    		;;
    26) 
    		sudo ./couchpotato-uninstaller.sh
    		;;
    27)
    		sudo ./couchpotato-backup.sh
    		;;
    28) 
    		sudo ./couchpotato-restore.sh
    		;;
			
    30)
    		sudo ./transmission-webui-installer.sh
    		;;
    31)
    		sudo ./transmission-webui-uninstaller.sh
    		;;
    		
	35)
		sudo ./qbittorrent-installer.sh
    		;;
    36)
    		sudo ./qbittorrent-uninstaller.sh
    		;;
    		
	40)
    		sudo ./sabnzbd-installer.sh
    		;;
	41)
    		sudo ./sabnzbd-uninstaller.sh
    		;;

	45)
    		sudo ./headphones-installer.sh
    		;;
	46)
    		sudo ./headphones-uninstaller.sh
    		;;
    
	50)
    		sudo ./mylar-installer.sh
    		;;
	51)
    		sudo ./mylar-uninstaller.sh
    		;;
			
	55)
    		sudo ./htpcmanager-installer.sh
    		;;
	56)
    		sudo ./htpcmanager-uninstaller.sh
    		;;

	60)
    		sudo ./plex-installer.sh
    		;;

	65)
    		sudo ./deluge-installer.sh
    		;;

	70)
    		sudo ./musicbrainz-installer.sh
    		;;
    	
    	75)
    		sudo ./webmin-installer.sh
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
