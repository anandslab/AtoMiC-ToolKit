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

echo -e $GREEN'AtoMiC ToolKit - HTPC / Home Server Setup Script'$ENDCOLOR
echo
echo -e $YELLOW'01. '$ENDCOLOR'Check and Update AtoMiC ToolKit'
echo -e $YELLOW'02. '$ENDCOLOR'Install .bash_aliases HTPC / Home Server administration'
echo -e $YELLOW'05. '$ENDCOLOR'Sick Beard - Install'
echo -e $YELLOW'06. '$ENDCOLOR'Sick Beard - Uninstall'
echo -e $YELLOW'07. '$ENDCOLOR'Sick Beard - Backup Database and Settings'
echo -e $YELLOW'08. '$ENDCOLOR'Sick Beard - Restore Database and Settings'
echo -e $YELLOW'09. '$ENDCOLOR'Sick Beard - Manual Update'$RED'(Planned)'$ENDCOLOR
echo -e $YELLOW'10. '$ENDCOLOR'SickRage - Install '$RED'(Broken - SickRage Issue)'$ENDCOLOR
echo -e $YELLOW'11. '$ENDCOLOR'SickRage - Uninstall'
echo -e $YELLOW'12. '$ENDCOLOR'SickRage - Backup Database and Settings'
echo -e $YELLOW'13. '$ENDCOLOR'SickRage - Restore Database and Settings'
echo -e $YELLOW'14. '$ENDCOLOR'SickRage - Manual Update'$RED'(Planned)'$ENDCOLOR
echo -e $YELLOW'15. '$ENDCOLOR'SickGear - Install'
echo -e $YELLOW'16. '$ENDCOLOR'SickGear - Uninstall'
echo -e $YELLOW'17. '$ENDCOLOR'SickGear - Backup Database and Settings'
echo -e $YELLOW'18. '$ENDCOLOR'SickGear - Restore Database and Settings'
echo -e $YELLOW'19. '$ENDCOLOR'SickGear - Manual Update'$RED'(Planned)'$ENDCOLOR
echo -e $YELLOW'20. '$ENDCOLOR'Sonarr (NzbDrone) - Install'
echo -e $YELLOW'21. '$ENDCOLOR'Sonarr (NzbDrone) - Uninstall'
echo -e $YELLOW'25. '$ENDCOLOR'CouchPotato - Install'
echo -e $YELLOW'26. '$ENDCOLOR'CouchPotato - Uninstall'
echo -e $YELLOW'27. '$ENDCOLOR'CouchPotato - Backup Database and Settings'
echo -e $YELLOW'28. '$ENDCOLOR'CouchPotato - Restore Database and Settings'
echo -e $YELLOW'29. '$ENDCOLOR'CouchPotato - Manual Update'$RED'(Planned)'$ENDCOLOR
echo -e $YELLOW'30. '$ENDCOLOR'Transmission - Install (WebUI only, no Desktop GUI) '$RED'(Broken)'$ENDCOLOR
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
echo -e $YELLOW'65. '$ENDCOLOR'Deluge - Install '$RED'(Broken)'$ENDCOLOR
echo -e $YELLOW'70. '$ENDCOLOR'MusicBrainz - Install '$RED'(In Progress)'$ENDCOLOR
echo -e $YELLOW'75. '$ENDCOLOR'Webmin - Install '$RED'(test)'$ENDCOLOR
echo -e $YELLOW'76. '$ENDCOLOR'Webmin - Uninstall '$RED'(test)'$ENDCOLOR
echo -e $YELLOW'77. '$ENDCOLOR'Webmin - Backup Settings '$RED'(Planned)'$ENDCOLOR
echo -e $YELLOW'78. '$ENDCOLOR'Webmin - Restore Settings '$RED'(Planned)'$ENDCOLOR
echo -e $YELLOW'80. '$ENDCOLOR'Monit - Install '$RED'(Planned)'$ENDCOLOR
echo -e $YELLOW'90. '$ENDCOLOR'MakeMKV - Install '$RED'(Broken)'$ENDCOLOR
echo -e $YELLOW'96. '$ENDCOLOR'See default port numbers, usernames, and passwords'
echo -e $YELLOW'97. '$ENDCOLOR'Clear all backups'
echo -e $YELLOW'98. '$ENDCOLOR'Clear temporary data: disclaimer consent and username'
echo -e $YELLOW'99. '$ENDCOLOR'Exit'

echo
tput bold
echo -n "What would you like to do [00-99]: "
tput sgr0
read option
case $option in
	1 | 01)
		sudo bash maintenance/update.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
		;;
	2 | 02)
         	sudo bash utils/bash_aliases-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
		;;
		
    5 | 05)
		sudo bash sickbeard/sickbeard-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
		;;
    6 | 06) 
    		sudo bash sickbeard/sickbeard-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    7 | 07)
    		sudo bash sickbeard/sickbeard-backup.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
	8 | 08)
    		sudo bash sickbeard/sickbeard-restore.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    	
    10)
    		sudo bash sickrage/sickrage-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    11)
    		sudo bash sickrage/sickrage-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    12)
    		sudo bash sickrage/sickrage-backup.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    13)
    		sudo bash sickrage/sickrage-restore.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
			
    15)
    		sudo bash sickgear/sickgear-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    16)
    		sudo bash sickgear/sickgear-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    17)
    		sudo bash sickgear/sickgear-backup.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    18)
    		sudo bash sickgear/sickgear-restore.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
			
    20)
    		sudo bash sonarr/sonarr-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    21)
    		sudo bash sonarr/sonarr-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
			
    25)
    		sudo bash couchpotato/couchpotato-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    26) 
    		sudo bash couchpotato/couchpotato-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    27)
    		sudo bash couchpotato/couchpotato-backup.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    28) 
    		sudo bash couchpotato/couchpotato-restore.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
			
    30)
    		sudo bash transmission/transmission-webui-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    31)
    		sudo bash transmission/transmission-webui-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    		
	35)
			sudo bash qbittorrent/qbittorrent-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    36)
    		sudo bash qbittorrent/qbittorrent-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    		
	40)
    		sudo bash sabnzbd/sabnzbd-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
	41)
    		sudo bash sabnzbd/sabnzbd-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;

	45)
    		sudo bash headphones/headphones-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
	46)
    		sudo bash headphones/headphones-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    
	50)
    		sudo bash mylar/mylar-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
	51)
    		sudo bash mylar/mylar-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
			
	55)
    		sudo bash htpcmanager/htpcmanager-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
	56)
    		sudo bash htpcmanager/htpcmanager-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;

	60)
    		sudo bash plex/plex-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
  	
   	75)
    		sudo bash webmin/webmin-installer.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
   	76)
    		sudo bash webmin/webmin-uninstaller.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
   	77)
    		sudo bash webmin/webmin-backup.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    	78)
    		sudo bash webmin/webmin-restore.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    		;;
    96)
    		sudo bash maintenance/defaults.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    	;;
    97)
			sudo bash maintenance/clearbackups.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    	;;
	98)
			sudo bash maintenance/cleartmp.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP"
    	;;
    99)
		echo 'Exiting...'
		
		source $SCRIPTPATH/inc/thankyou.sh
		
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
