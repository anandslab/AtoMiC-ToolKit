#!/bin/bash
# shellcheck disable=SC1090

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"

echo -e "${GREEN}AtoMiC $APPTITLE Access Details$ENDCOLOR"

source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-folder-check.sh"

if [[ $APPSETTINGSTYPE = "DB" ]]; then
    source "$SCRIPTPATH/inc/app-port-search.sh"
    source "$SCRIPTPATH/inc/db-app-user-search.sh"  >/dev/null
    source "$SCRIPTPATH/inc/db-app-password-search.sh"  >/dev/null
    #echo "I did a grep for the port and a DB query for the creds"
else
    source "$SCRIPTPATH/inc/app-port-search.sh"
    source "$SCRIPTPATH/inc/app-user-search.sh"  >/dev/null
    source "$SCRIPTPATH/inc/app-password-search.sh"  >/dev/null
    #echo "I'm doing a grep text search for port and creds"
fi

source "$SCRIPTPATH/inc/app-system-details.sh"
source "$SCRIPTPATH/inc/app-access-urls.sh"
source "$SCRIPTPATH/inc/app-access-credentials.sh"

if [[ ! $ACCESSHOST = 'NA' ]]; then
    if grep -Exq "${ACCESSHOST}localhost" "$APPSETTINGS"; then
        echo -e "${RED}WARNING: ${ENDCOLOR}You can only access $APPTITLE on localhost."
    else
        echo -e "$GREEN GOOD: $ENDCOLOR$APPTITLE is accessible outside localhost."
    fi
fi

source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
