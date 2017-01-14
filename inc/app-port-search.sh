#!/bin/bash
echo -e $YELLOW'--->Searching '$APPSETTINGS' for possible port numbers...'$ENDCOLOR
if [ "$PORTSEARCH" == "NA" ] || [ "$APPSETTINGS" == "NA" ]; then
	APPPORT=$APPDPORT
	echo -e 'Incompatibility. Cannot determine port.'
	echo -e 'Try default port: '$GREEN$APPDPORT$ENDCOLOR
else
	echo -e 'Found the following port numbers:'
	grep "$PORTSEARCH" $APPSETTINGS | grep -v "http" | grep -Eo '[0-9]{4}'
	PORTSTRING=$(grep "$PORTSEARCH" $APPSETTINGS | grep -v "https" | head -1)
	#echo 'portstring = '$PORTSTRING
	APPPORT=${PORTSTRING//[!0-9]/}
	#echo 'appport = '$APPPORT
	if [ ! -z "$APPPORT" ]; then
		echo -e 'Possible port: '$APPPORT'. If this does not work, try the other ports listed above.'
    	UIPORTSTATUS="Set"      
	else
		APPPORT=$APPDPORT
    	UIPORTSTATUS=""        
        if [ -z "$UIPORTSTATUS" ] && [ ! -z "$APPDPORT" ]; then
   			echo -e 'Try default port: '$GREEN$APPDPORT$ENDCOLOR
		fi
	fi
fi
