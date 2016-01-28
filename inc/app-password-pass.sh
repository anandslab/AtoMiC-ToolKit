#!/bin/bash
echo 
sleep 1
echo -e $YELLOW'Setting temporary '$APPTITLE' WebUI password...'$ENDCOLOR
sed -i 's@'"$PASSSEARCH$UIPASS"'@'"$PASSSEARCH$NEWPASS"'@g' $APPSETTINGS || { echo -e $RED'Setting temporary password failed.'$ENDCOLOR ; exit 1; }
echo -e 'Temporary password set to: '$CYAN'atomic'$ENDCOLOR
