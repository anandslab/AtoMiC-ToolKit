#!/bin/bash
echo -e $YELLOW'--->Finding '$APPTITLE' access port...'$ENDCOLOR
PORTSTRING=$(grep "$PORTSEARCH" $APPSETTINGS | head -1)
#echo $PORTSTRING
APPPORT=${PORTSTRING//[!0-9]/}
#echo $APPPORT
if [ ! -z "$APPPORT" ]; then
	echo -e 'Found. Using port: '$APPPORT;
else
	APPPORT=$APPDPORT
    echo -e 'Not found. Using default port: '$APPDPORT
fi