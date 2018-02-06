#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC http response check
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-system-details.sh"

if [[ $APPUSESNGINX = 'YES' ]]; then
    DIVIDE='/'
else
    DIVIDE=':'
fi

HttpResponseCheck()
{
    response=$(curl -Lo /dev/null --silent --head --write-out '%{http_code}\n' "$1" | grep '000\|404\|502')
    if [[ -n $response ]]; then
        echo -e "${RED}Error! couldnt connect to: $CYAN$1$ENDCOLOR"
        ERRORFOUND+=1
    else
        echo -e "${CYAN}Address: ${GREEN}$1 ${CYAN}Available $ENDCOLOR"
        return 0
    fi
}

HttpResponseCheck "$HNAME$DIVIDE$APPDPORT"
HttpResponseCheck "$LANIP$DIVIDE$APPDPORT"
HttpResponseCheck "127.0.0.1$DIVIDE$APPDPORT"
HttpResponseCheck "0.0.0.0$DIVIDE$APPDPORT"

if [[ $APPUSESNGINX != 'YES' ]]; then
    HttpResponseCheck "localhost:$APPDPORT"
    HttpResponseCheck "$HNAME/$APPNAME"
    HttpResponseCheck "$LANIP/$APPNAME"
    HttpResponseCheck "127.0.0.1/$APPNAME"
    HttpResponseCheck "0.0.0.0/$APPNAME"
fi
