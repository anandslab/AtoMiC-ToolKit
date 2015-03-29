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
echo -e $YELLOW'01. '$ENDCOLOR'Install .bash_aliases HTPC / Home Server administration'
echo -e $YELLOW'02. '$ENDCOLOR'Install Sick Beard'
echo -e $YELLOW'03. '$ENDCOLOR'Install SickRage'
echo -e $YELLOW'04. '$ENDCOLOR'Install SickGear'
echo -e $YELLOW'05. '$ENDCOLOR'Install Sonarr / NzbDrone'
echo -e $YELLOW'06. '$ENDCOLOR'Install CouchPotato'
echo -e $YELLOW'07. '$ENDCOLOR'Install Transmission with WebUI (no Desktop GUI)'
echo -e $YELLOW'08. '$ENDCOLOR'Uninstall Sick Beard'
echo -e $YELLOW'09. '$ENDCOLOR'Uninstall SickRage'
echo -e $YELLOW'10. '$ENDCOLOR'Uninstall SickGear'
echo -e $YELLOW'11. '$ENDCOLOR'Uninstall Sonarr / NzbDrone'
echo -e $YELLOW'12. '$ENDCOLOR'Uninstall CouchPotato'
echo -e $YELLOW'13. '$ENDCOLOR'Uninstall Transmission with WebUI '$CYAN'(coming soon)'$ENDCOLOR
echo -e $YELLOW'14. '$ENDCOLOR'Backup SickBeard Database and Settings'
echo -e $YELLOW'15. '$ENDCOLOR'Backup SickRage Database and Settings'
echo -e $YELLOW'16. '$ENDCOLOR'Backup SickGear Database and Settings'
echo -e $YELLOW'17. '$ENDCOLOR'Backup CouchPotato with Database '$CYAN'(coming soon)'$ENDCOLOR
echo -e $YELLOW'18. '$ENDCOLOR'Restore Sick Beard Database and Settings'
echo -e $YELLOW'19. '$ENDCOLOR'Restire SickRage Database and Settings'
echo -e $YELLOW'20. '$ENDCOLOR'Restore SickGear Database and Settings'
echo -e $YELLOW'99. '$ENDCOLOR'Exit'

echo
echo -n "What would you like to do [01-99]: "
read option
case $option in
    1 | 01)
         	sudo ./bash_aliases-installer.sh
			;;
    2 | 02)
			sudo ./sickbeard-installer.sh
			;;
    3 | 03)
    		sudo ./sickrage-installer.sh
    		;;
    4 | 04)
    		sudo ./sickgear-installer.sh
    		;;
    5 | 05)
    		sudo ./sonarr-installer.sh
    		;;
    6 | 06)
    		sudo ./couchpotato-installer.sh
    		;;
    7 | 07)
    		sudo ./transmission-webui-installer.sh
    		;;
    8 | 08) 
    		sudo ./sickbeard-uninstaller.sh
    		;;
    9 | 09)
    		sudo ./sickrage-uninstaller.sh
    		;;
    10)
    		sudo ./sickgear-uninstaller.sh
    		;;
    11)
    		sudo ./sonarr-uninstaller.sh
    		;;
    12) 
    		sudo ./couchpotato-uninstaller.sh
    		;;
    14)
    		sudo ./sickbeard-backup.sh
    		;;
    15)
    		sudo ./sickrage-backup.sh
    		;;
    16)
    		sudo ./sickgear-backup.sh
    		;;
	18)
    		sudo ./sickbeard-restore.sh
    		;;
    19)
    		sudo ./sickrage-restore.sh
    		;;
    20)
    		sudo ./sickgear-restore.sh
    		;;
    99)
		echo 'Exiting...'
		echo
		echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
		echo -e $YELLOW'Thank you for using the AtoMiC ToolKit from www.htpcBeginner.com.'$ENDCOLOR 
		echo
		sleep 5
		URL=http://www.htpcbeginner.com/atomic-thanks
		[[ -x $BROWSER ]] && exec "$BROWSER" "$URL"
		path=$(which xdg-open || which gnome-open) && exec "$path" "$URL" >/dev/null 2>&1
		;;
    *)
        echo 'Invalid Option'
		ScriptLoc=$(readlink -f "$0")
		sleep 1
		exec $ScriptLoc
esac
