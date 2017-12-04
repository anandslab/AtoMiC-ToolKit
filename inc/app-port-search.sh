#!/bin/bash

echo -e "$YELLOW--->Searching for possible port numbers...$ENDCOLOR"
if [[ -n $APPDPORT ]]; then
    echo -e "${CYAN}Default port: $ENDCOLOR$GREEN$APPDPORT$ENDCOLOR found in AtoMiC-ToolKit config."
fi

if [[ $PORTSEARCH == "NA" ]] || [[ -z $APPSETTINGS ]]; then
    echo -e "Cannot determine port set in $CYAN$APPTITLE$ENDCOLOR config."
else
    PORTSTRING=$(grep "$PORTSEARCH" $APPSETTINGS | grep -v "https" | head -1 | sed -e "s#.*$PORTSEARCH\\(\\)#\\1#")
    if [[ -n $PORTSTRING ]]; then
        echo -e "${CYAN}Configured port: $ENDCOLOR$GREEN${PORTSTRING//[!0-9]/}$ENDCOLOR found in $APPSETTINGS."
    fi
fi
