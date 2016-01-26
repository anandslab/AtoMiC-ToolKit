#!/bin/bash
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
