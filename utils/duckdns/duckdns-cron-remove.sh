#!/bin/bash
echo -e "${GREEN}DuckDNS Removal Script$ENDCOLOR"
echo
echo "Are you sure you want to remove the DuckDNS update cron job?"

source "$SCRIPTPATH/inc/pause.sh"

echo -e "$YELLOW--->Removing Duck DNS Cron Job...$ENDCOLOR"

source "$SCRIPTPATH/inc/crontab-handler.sh"
RemoveCronTab

source "$SCRIPTPATH/utils/duckdns/duckdns-domain-remove.sh"
source "$SCRIPTPATH/inc/app-file-del.sh"
echo
echo -e "${GREEN}---> $APPTITLE Removal complete.$ENDCOLOR"
