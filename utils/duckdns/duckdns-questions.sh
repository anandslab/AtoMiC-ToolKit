#!/bin/bash
echo "This will create a cron job to run every 5mins to keep your IP up to date on Duck DNS."
echo -e "${CYAN}Please make sure you have registered for an account at ${GREEN}https://www.duckdns.org$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"

DOMAINNAME=$(whiptail --inputbox "What is your Duck DNS Sub Domain names without .duckdns.org? i.e MySubSiteName (for more than one, use a comma separated list)" \
10 60 --title "Domain Name" 3>&1 1>&2 2>&3)
exitstatus=$?

DOMAINNAME="$(echo -e "${DOMAINNAME}" | sed 's/\(,\)*$//;s/^\(,\)*//;s/.duckdns.org//' | tr -d '[:space:]' | tr '[:upper:]' '[:lower:]')"
if [[ -z $DOMAINNAME ]]; then
    echo -e "${RED}DOMAINNAME not specified. Aborting$ENDCOLOR"
fi

if [[ $exitstatus = 0 && -n $DOMAINNAME ]]; then
    TOKENID=$(whiptail --inputbox "What is your Duck DNS TOKEN ID?" \
    10 60 --title "Token ID" 3>&1 1>&2 2>&3)
fi

if [[ -z $TOKENID && -n $DOMAINNAME ]]; then
    echo -e "${RED}TOKENID not specified. Aborting$ENDCOLOR"
fi
