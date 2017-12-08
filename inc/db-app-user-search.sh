#!/bin/bash
echo
sleep 1
echo -e "$YELLOW--->Finding $APPTITLE WebUI username...$ENDCOLOR"
if [[ $DBUSERSEARCH = "NA" ]] || [[ $APPSETTINGSDB = "NA" ]]; then
    echo -e 'Incompatibility. Cannot determine username.'
    UINAME='Cannot determine or username not set.'
else
    UINAME=$(echo "$DBUSERSEARCH" | sqlite3 "$APPSETTINGSDB")

    if [[ ! -z $UINAME ]] && [[ $UINAME != "" ]]; then
        echo -e "Found. Using username: $UINAME";
        UINAMESTATUS="Set"
    else
        UINAME='Cannot determine or username not set.'
        UINAMESTATUS=""
        echo -e 'Cannot determine or username not set.'
        if [[ -z $UINAMESTATUS ]] && [[ ! -z $APPDEFAULTUNAME ]]; then
            echo -e "Try default username: $GREEN$APPDEFAULTUNAME$ENDCOLOR"
        fi
    fi
fi
