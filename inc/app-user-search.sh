#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Finding '$APPTITLE' WebUI username...'$ENDCOLOR
if [ "$USERSEARCH" == "NA" ] || [ "$APPSETTINGS" == "NA" ]; then
    echo -e 'Incompatibility. Cannot determine username.'
    UINAME='Cannot determine or username not set.'
else
	UINAMESTRING=$(grep "$USERSEARCH" $APPSETTINGS | head -1)
	#echo 'Search String: '$USERSEARCH
    #echo 'Search Output: '$UINAMESTRING
    UINAME=${UINAMESTRING##*$USERSEARCH}
    #echo 'Everything after usersearch: '$UINAME
	#UINAME=$(cut -d "=" -f 2 <<< "$UINAMESTRING")
	#UINAME=${UINAME//[[:blank:]]/}
    UINAME=$(echo "$UINAME" | tr -dc '[:alnum:]')
	#echo 'Final username: '$UINAME
    
	if [ ! -z "$UINAME" ] && [ $UINAME != '""' ]; then
		echo -e 'Found. Using username: '$UINAME;
    	UINAMESTATUS="Set"
	else
		UINAME='Cannot determine or username not set.'
    	UINAMESTATUS=""
    	echo -e 'Cannot determine or username not set.'
        if [ -z "$UINAMESTATUS" ] && [ ! -z "$APPDEFAULTUNAME" ]; then
   			echo -e 'Try default username: '$GREEN$APPDEFAULTUNAME$ENDCOLOR
		fi
	fi
fi
