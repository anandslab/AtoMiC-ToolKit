#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Finding '$APPTITLE' WebUI username...'$ENDCOLOR
if [ ! $USERSEARCH=="NA" ] || [ ! $APPSETTINGS == "NA" ]; then
	UINAMESTRING=$(grep "$USERSEARCH" $APPSETTINGS | head -1)
	#echo $UINAMESTRING
	UINAME=$(cut -d "=" -f 2 <<< "$UINAMESTRING")
	UINAME=${UINAME//[[:blank:]]/}
	#echo $UINAME
	if [ ! -z "$UINAME" ] && [ $UINAME != '""' ]; then
		echo -e 'Found. Using username: '$UINAME;
    	UINAMESTATUS="Set"
	else
		UINAME='Cannot determine or username not set.'
    	UNINAMESTATUS=""
    	echo -e 'Cannot determine or username not set.'
	fi
else
    echo -e 'Incompatibility. Cannot determine username.'
fi