#!/bin/bash
echo 
sleep 1
if [ ! -z $UINAMESTATUS ]; then
	#echo 'old password line: '$PASSSEARCH$UIPASS
    #echo 'new password line: '$PASSSEARCH$NEWPASS
	echo -e $YELLOW'Setting temporary '$APPTITLE' WebUI password...'$ENDCOLOR
	sed -i 's|'"$PASSSEARCH$UIPASS"'|'"$PASSSEARCH$NEWPASS"'|g' $APPSETTINGS || { echo -e $RED'Setting temporary password failed.'$ENDCOLOR ; exit 1; }
	echo -e 'Password set to: '$GREEN$APPNEWPASS$ENDCOLOR
else
	echo -e $YELLOW'Setting temporary '$APPTITLE' WebUI password...'$ENDCOLOR
    echo -e $RED'No active username found. Password cannot be reset. '$ENDCOLOR'Open '$APPTITLE' and set username and password.'
fi
