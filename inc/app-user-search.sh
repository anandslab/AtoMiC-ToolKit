#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Finding '$APPTITLE' WebUI username...'$ENDCOLOR
UINAMESTRING=$(grep "$USERSEARCH" $APPSETTINGS | head -1)
#echo $UINAMESTRING
UINAME=$(cut -d "=" -f 2 <<< "$UINAMESTRING")
UINAME=${UINAME//[[:blank:]]/}
#echo $UINAME
if [ ! -z "$UINAME" ]; then
	echo -e 'Found. Using username: '$UINAME;
else
	UINAME='Cannot determine or username not set.'
    echo -e 'Cannot determine or username not set.'
fi