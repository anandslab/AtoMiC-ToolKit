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

# Verify Dialog Package Installed
cmd="dpkg -l dialog"

if [ $(cmd) -ne 0 ]; then
	echo -e $YELLOW'--->Installing necessary '$CYAN'dialog'$YELLOW' package...'$ENDCOLOR
	sudo apt-get -y install dialog
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

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure the selected packages.'
echo -e '5. Best used on a clean system (with no previous selected package install) or after complete removal of previous selected package installation.'

echo

read -p 'Type y/Y and press [ENTER] to AGREE and continue with the installation or any other key to exit: '
RESP=${REPLY,,}

if [ "$RESP" != "y" ] 
then
	echo -e $RED'So you chickened out. May be you will try again later.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	exit 0
fi

#
# Create a dialog for the control user
# Source the user to all of the options
#
# user_input=$(dialog --title "Master User" --clear --inputbox "Enter the master username:" 8 40)

cmd=(dialog --backtitle "http://www.htpcBeginner.com" \
	--title "AtoMiC ToolKit - HTPC / Home Server Setup Script" \
	--separate-output --checklist "Use the UP/DOWN arrow keys to scroll. \n\
	Press SPACE to toggle an option on/off. \n\n\
		Which packages to install?" 22 76 16)
		
options=(
	00	'Read README.txt'											off
	01	'Check and Update AtoMiC ToolKit'							off
	02	'Install .bash_aliases HTPC / Home Server administration'	off
	05	'Sick Beard - Install'										off
	06	'Sick Beard - Uninstall'									off
	07	'Sick Beard - Backup Database and Settings'					off
	08	'Sick Beard - Restore Database and Settings'				off
	10	'SickRage - Install'										off
	11	'SickRage - Uninstall'										off
	12	'SickRage - Backup Database and Settings'					off
	13	'SickRage - Restore Database and Settings'					off
	15	'SickGear - Install'										off
	16	'SickGear - Uninstall'										off
	17	'SickGear - Backup Database and Settings'					off
	18	'SickGear - Restore Database and Settings'					off
	20	'Sonarr (NzbDrone) - Install'								off
	21	'Sonarr (NzbDrone) - Uninstall'								off
	25	'CouchPotato - Install'										off
	26	'CouchPotato - Uninstall'									off
	27	'CouchPotato - Backup Database and Settings'				off
	28	'CouchPotato - Restore Database and Settings'				off
	30	'Transmission - Install (WebUI only, no Desktop GUI)'		off
	31	'Transmission - Uninstall'									off
	35	'qBittorrent - Install (WebUI only, no Desktop GUI)'		off
	36	'qBittorrent - Uninstall'									off
	40	'SABNzbd - Install'											off
	41	'SABNzbd - Uninstall'										off
	45	'Headphones - Install'										off
	46	'Headphones - Uninstall'									off
	50	'Mylar - Install'											off
	51	'Mylar - Uninstall'											off
	55	'HTPC Manager - Install'									off
	56	'HTPC Manager - Uninstall'									off
	60	'Plex Server - Install'										off
	65	'Deluge - Install'											off
	70	'MusicBrainz - Install'										off
	75	'Webmin - Install'											off
	98	'See default port numbers, usernames, and passwords'		off
)
         
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear

for choice in $choices
do
    case $choice in
		 0)
			less README.txt
			;;
		 1)
			sudo ./atomic-updater.sh
			;;
		 2)
         	sudo ./bash_aliases-installer.sh
			;;
		 5)
			sudo ./sickbeard-installer.sh
			;;
		 6) 
    		sudo ./sickbeard-uninstaller.sh
    		;;
		 7)
    		sudo ./sickbeard-backup.sh
    		;;
		 8)
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
    		sudo ./headphones-installer.sh
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
    esac
done

#URL=http://www.htpcbeginner.com/atomic-thanks
#[[ -x $BROWSER ]] && exec "$BROWSER" "$URL"
#path=$(which xdg-open || which gnome-open) && exec "$path" "$URL" >/dev/null 2>&1
#ScriptLoc=$(readlink -f "$0")
#sleep 1
#exec $ScriptLoc

clear
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC ToolKit from www.htpcBeginner.com.'$ENDCOLOR 
echo
sleep 2
