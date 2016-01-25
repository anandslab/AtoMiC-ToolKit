#!/bin/bash
echo -e $YELLOW'--->Stopping '$APPTITLE'...'$ENDCOLOR
sudo /etc/init.d/$APPNAME stop >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Removing '$APPTITLE' Autostart scripts...'$ENDCOLOR
sudo update-rc.d -f $APPNAME remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
sudo rm /etc/default/$APPNAME || { echo -e $RED'Warning! Removing default script failed.'$ENDCOLOR ; }
sudo rm /etc/init.d/$APPNAME || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }

echo
sleep 1

echo -e $GREEN'Do you want to keep '$APPTITLE' installation files as a backup or for reinstalling later?'$ENDCOLOR
read -p 'Type y/Y to keep files or any other key to delete files, and press [ENTER] : '
FILEDEL=${REPLY,,}

if [ "$FILEDEL" != "y" ] 
then
	echo
    if [ -d "$APPPATH" ]; 
	then
		echo -e $YELLOW'--->Deleting '$APPTITLE' files from '$CYAN$APPPATH$YELLOW'...'$ENDCOLOR
		sudo rm -r $APPPATH
    else
    	echo -e $RED'--->'$APPTITLE' files not deleted. Path not found: '$CYAN$APPPATH$ENDCOLOR
    fi
else
	echo
	echo -e $YELLOW'--->Keeping '$APPTITLE' files in '$CYAN$APPPATH$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

echo -e $GREEN'--->All done.'$ENDCOLOR
echo -e $APPTITLE' Uninstalled.'