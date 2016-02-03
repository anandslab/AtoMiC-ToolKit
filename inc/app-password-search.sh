#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Finding '$APPTITLE' WebUI password...'$ENDCOLOR
if [ "$PASSSEARCH" == "NA" ] || [ "$APPSETTINGS" == "NA" ]; then
    echo -e 'Incompatibility. Cannot determine password.'
else
	UIPASSSTRING=$(grep "$PASSSEARCH" $APPSETTINGS | head -1)
    #echo 'Search String: '$PASSSEARCH
    #echo 'Search Output: '$UIPASSSTRING
    UIPASS=${UIPASSSTRING##*$PASSSEARCH}
    #echo 'Everything after usersearch: '$UIPASS
    #UIPASS=$(cut -d "=" -f 2 <<< "$UIPASSSTRING")
	#UIPASS=${UIPASS//[[:blank:]]/}
    UIPASS=$(echo "$UIPASS" | tr -dc '[:alnum:]')
	#echo 'Final password: '$UIPASS
    
	if [ ! -z "$UIPASS" ]; then
		echo -e 'Password found.';
		UIPASSSTATUS="Set"
	else
		echo -e 'No password found.';
    	UIPASSSTATUS=""        
        if [ -z "$UIPASSSTATUS" ] && [ ! -z "$APPDEFAULTPASS" ]; then
   			echo -e 'Try default password: '$GREEN$APPDEFAULTPASS$ENDCOLOR
		fi
   	fi
fi
