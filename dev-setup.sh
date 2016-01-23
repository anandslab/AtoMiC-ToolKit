#!/bin/bash
# Script Name: AtoMiC ToolKit
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

#http://www.tutorialspoint.com/unix_commands/whiptail.htm
#https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail
#http://xmodulo.com/create-dialog-boxes-interactive-shell-script.html
#http://www.cyberciti.biz/tips/spice-up-your-unix-linux-shell-scripts.html

# Set caller id and script path
export CALLER=$(ps ax | grep "^ *$PPID" | awk '{print $NF}')
export SCRIPTPATH=$(pwd)

source $SCRIPTPATH/inc/commons.sh

# Check if being run as root
if [ "$EUID" -ne 0 ]
  then 
  echo
  echo -e $RED'Please run as root using the command: '$ENDCOLOR'sudo bash setup.sh'
  echo
  exit 0
fi

source $SCRIPTPATH/inc/header.sh

echo -e $RED'This setup file is in development and can mess up your system. Exit and run '$CYAN'sudo ./setup.sh'$RED' instead.'$ENDCOLOR
source $SCRIPTPATH/inc/pause.sh

sleep 1

if [ ! -d "$SCRIPTPATH/tmp" ]; then
	mkdir $SCRIPTPATH/tmp
fi

if [ ! -d "$SCRIPTPATH/backups" ]; then
	mkdir $SCRIPTPATH/backups
fi

echo -e $YELLOW'--->DISCLAIMERS:'$ENDCOLOR
if [ ! -f "$SCRIPTPATH/tmp/consented" ]; then
	#echo 'consent file not present'
	source $SCRIPTPATH/inc/consent.sh
else
	echo -e 'Already agreed. Can be cleared in the next screen.'
fi

echo
sleep 1

echo -e $YELLOW'--->USER INFORMATION:'$ENDCOLOR
if [ ! -f "$SCRIPTPATH/tmp/userinfo" ]; then
	#echo 'userinfo not present'
	source $SCRIPTPATH/inc/usercheck.sh
else 
	#echo 'userinfo present'
	source $SCRIPTPATH/tmp/userinfo
	if [ -z "$UNAME" ] || [ -z "$UGROUP" ]; then
		#echo 'userinfo not complete'
		source $SCRIPTPATH/inc/usercheck.sh
	else
		echo -e 'Already present: '$CYAN$UNAME$ENDCOLOR. 'Can be cleared in the next screen.'
		source $SCRIPTPATH/inc/pause.sh
	fi
fi

# Set permissions for all files
sudo chown -R $UNAME:$UGROUP $SCRIPTPATH >/dev/null 2>&1
sudo chmod -R 775 $SCRIPTPATH >/dev/null 2>&1
sudo chmod -R g+s $SCRIPTPATH >/dev/null 2>&1
    
source $SCRIPTPATH/inc/header.sh

#eval `resize`
#$LINES $COLUMNS $(( $LINES - 15 )) 25 78 16 
MAINCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" --menu "What would you like to do?" 25 78 16 \
"SickBeard" "Install, Uninstall, Backup, Restore, and Update." \
"SickRage" "Install, Uninstall, Backup, Restore, and Update." \
"SickGear" "Install, Uninstall, Backup, Restore, and Update." \
"Sonarr" "Install and Uninstall" \
"CouchPotato" "Install, Uninstall, Backup, Restore, and Update." \
"Transmission" "Install (headless) and Uninstall." \
"qBittorrent" "Install (headless) and Uninstall." \
"SABnzbd" "Install and Uninstall." \
"Headphones" "Install and Uninstall." \
"Mylar" "Install and Uninstall." \
"HTPC Manager" "Install and Uninstall." \
"Plex Server" "Install." \
"Webmin" "Modify a group and its list of members." \
"Maintenance" "List all groups on the system." 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Your chosen option:" $MAINCHOICE
    case "$MAINCHOICE" in 
		"SickBeard" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"SickRage" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"SickGear" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Sonarr" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"CouchPotato" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Transmission" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"qBittorrent" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"SABnzbd" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Headphones" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Mylar" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"HTPC Manager" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Plex" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Webmin" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Maintenance" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
	#*) echo "Exit" ;;
	esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    source $SCRIPTPATH/inc/exit.sh
fi
