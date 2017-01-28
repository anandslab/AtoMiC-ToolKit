#!/bin/bash

echo -e $YELLOW"--->Searching for possible port numbers..."$ENDCOLOR
if [ "$PORTSEARCH" == "NA" ] || [ "$APPSETTINGS" == "NA" ]; then
	echo -e 'Incompatibility. Cannot determine port.'
	echo -e 'Try default port: '$GREEN$APPDPORT$ENDCOLOR
else
	if ! [ -z "$APPDPORT" ]; then
		echo -e $CYAN'Default port: '$ENDCOLOR$GREEN$APPDPORT$ENDCOLOR' found in AtoMiC Toolkit config.'     
	fi
	
	PORTSTRING=$(grep "$PORTSEARCH" $APPSETTINGS | grep -v "https" | head -1)  
	if ! [ -z "$PORTSTRING" ]; then
		echo -e $CYAN'Configured port: '$ENDCOLOR$GREEN${PORTSTRING//[!0-9]/}$ENDCOLOR' found in '$APPSETTINGS'.'
	fi
fi
