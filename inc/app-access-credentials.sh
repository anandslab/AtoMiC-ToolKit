#!/bin/bash
echo
sleep 1
if grep -q "Reset Password" "$SCRIPTPATH/inc/menu-$APPNAME.sh"; then
   	RESETSUPPORT='If you forgot, you may use the AtoMiC '$APPTITLE' password reset utitlity.'
else
	RESETSUPPORT=''
fi
echo -e $YELLOW'Your '$APPTITLE' credentials are...'$ENDCOLOR
echo -e '--->'$CYAN'Username: '$GREEN$UINAME$ENDCOLOR
echo -e '--->'$CYAN'Password: '$RED'Not displayed for security. '$ENDCOLOR$RESETSUPPORT
