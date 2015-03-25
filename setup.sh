#!/bin/bash
# Script Name: AtoMiC ToolKit
# Author: htpcBeginner.com
# Publisher: http://www.htpcBeginner.com
# Version: 1.0 (March 15, 2015) - Initial Release
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
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
echo -e $YELLOW'04. '$ENDCOLOR'Install SickGear '$CYAN'(coming soon)'$ENDCOLOR
echo -e $YELLOW'05. '$ENDCOLOR'Install Sonarr / NzbDrone '$CYAN'(coming soon)'$ENDCOLOR
echo -e $YELLOW'06. '$ENDCOLOR'Install CouchPotato'
echo -e $YELLOW'07. '$ENDCOLOR'Install Transmission with WebUI (no Desktop GUI)'
echo -e $YELLOW'08. '$ENDCOLOR'Uninstall Sick Beard'$ENDCOLOR
echo -e $YELLOW'09. '$ENDCOLOR'Uninstall SickRage'$ENDCOLOR
echo -e $YELLOW'10. '$ENDCOLOR'Uninstall SickGear '$CYAN'(coming soon)'$ENDCOLOR
echo -e $YELLOW'11. '$ENDCOLOR'Uninstall Sonarr / NzbDrone '$CYAN'(coming soon)'$ENDCOLOR
echo -e $YELLOW'12. '$ENDCOLOR'Uninstall CouchPotato'$ENDCOLOR
echo -e $YELLOW'13. '$ENDCOLOR'Uninstall Transmission with WebUI '$CYAN'(coming soon)'$ENDCOLOR
echo -e $YELLOW'14. '$ENDCOLOR'Backup SickBeard with Database '$CYAN'(coming soon)'$ENDCOLOR
echo -e $YELLOW'15. '$ENDCOLOR'Backup SickRage with Database '$CYAN'(coming soon)'$ENDCOLOR
echo -e $YELLOW'16. '$ENDCOLOR'Backup SickGear with Database '$CYAN'(coming soon)'$ENDCOLOR
echo -e $YELLOW'17. '$ENDCOLOR'Backup CouchPotato with Database '$CYAN'(coming soon)'$ENDCOLOR
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
    12) 
    		sudo ./couchpotato-uninstaller.sh
    		;;
    13)
    		sudo ./transmission-webui-uninstaller.sh
    		;;
    99)
		echo 'Exiting...'
		sleep 1
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
