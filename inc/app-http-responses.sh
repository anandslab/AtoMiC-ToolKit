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
    # if [[ $1 = *":"* ]]; then
    #     CURLSTR='-o'
    # else
    #     CURLSTR='-Lo'
    # fi

    response=$(curl -L --write-out "%{http_code}" --silent --output /dev/null "$1" | grep '200\|401')
    if [[ -z $response ]]; then
        echo -e "${CYAN}Address: ${YELLOW}$1 ${RED}Error! couldnt connect$ENDCOLOR"
        ERRORFOUND+=1
    else
        echo -e "${CYAN}Address: ${GREEN}$1 ${CYAN}Available $ENDCOLOR"
        return 0
    fi
}

HttpResponseCheck "$HNAME$DIVIDE$APPDPORT/$NGINXCONFNAME"
HttpResponseCheck "$LANIP$DIVIDE$APPDPORT/$NGINXCONFNAME"
HttpResponseCheck "127.0.0.1$DIVIDE$APPDPORT/$NGINXCONFNAME"
HttpResponseCheck "0.0.0.0$DIVIDE$APPDPORT/$NGINXCONFNAME"

if [[ $APPUSESNGINX != 'YES' ]]; then
    HttpResponseCheck "localhost:$APPDPORT/$NGINXCONFNAME"
    HttpResponseCheck "$HNAME/$NGINXCONFNAME"
    HttpResponseCheck "$LANIP/$NGINXCONFNAME"
    HttpResponseCheck "127.0.0.1/$NGINXCONFNAME"
    HttpResponseCheck "0.0.0.0/$NGINXCONFNAME"
fi

# if [[ -n $ERRORFOUND ]]; then
#     exit 1
# fi
