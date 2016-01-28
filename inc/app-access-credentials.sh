#!/bin/bash
echo
sleep 1
if grep -q "reset.sh" "$SCRIPTPATH/inc/menu-$APPNAME.sh"; then
   	RESETSUPPORT='If you forgot, you may use the AtoMiC '$APPTITLE' password reset utitlity.'
else
	RESETSUPPORT=''
fi
echo -e $YELLOW'Your '$APPTITLE' credentials are...'$ENDCOLOR
echo -e '--->'$CYAN'Username: '$GREEN$UINAME$ENDCOLOR
echo -e '--->'$CYAN'Password: '$RED'Not displayed for security. '$ENDCOLOR$RESETSUPPORT

echo 
	sleep 1
	echo -e $YELLOW'Checking '$APPTITLE' status...'$ENDCOLOR
if [ -f /etc/init.d/$APPNAME ]; then
	if [[ $(sudo /etc/init.d/$APPNAME status) == *"not running"* ]]; then
		echo -e $RED$APPTITLE' is currently not running and will be inaccessible.'$ENDCOLOR
       	echo -e 'Start '$APPTITLE' using the following command: '$CYAN'sudo /etc/init.d/'$APPNAME' start'$ENDCOLOR
    else
    	echo -e $APPTITLE' is running and accessible.'
    fi
else
    echo -e $RED$APPTITLE' not installed properly or incompatible installation.'$ENDCOLOR' You may try reinstalling '$APPTITLE'.'
fi