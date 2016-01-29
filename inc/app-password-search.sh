#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Finding '$APPTITLE' WebUI password...'$ENDCOLOR
if [ ! $PASSSEARCH=="NA" ] && [ ! $APPSETTINGS == "NA" ]; then
	UIPASSSTRING=$(grep "$PASSSEARCH" $APPSETTINGS | head -1)
	UIPASS=$(cut -d "=" -f 2 <<< "$UIPASSSTRING")
	UIPASS=${UIPASS//[[:blank:]]/}
	if [ ! -z "$UIPASS" ]; then
		echo -e 'Password found.';
	else
		echo -e 'No password found.';
	fi
else
    echo -e 'Incompatibility. Cannot determine password.'
fi