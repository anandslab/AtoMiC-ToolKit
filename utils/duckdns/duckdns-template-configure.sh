#!/bin/bash
echo
echo -e "${YELLOW}--->Creating Cron Job file...$ENDCOLOR"

#Copy the template
if cp "$SCRIPTPATH/utils/duckdns/duckdns-cron-template.sh" "$APPPATH/duck.sh" || \
    { echo -e "${RED}Could not move Cron Template file over.$ENDCOLOR"; exit 1; }; then
    echo "Cron Job template file copied over"
fi

#update template
if sed -i "s/DOMAINNAME/$DOMAINNAME/" "$APPPATH/duck.sh" || \
    { echo -e "${RED}Could not update DOMAINNAME with $DOMAINNAME in $APPPATH/duck.sh$ENDCOLOR"; exit 1; }; then
    echo -e "Updated ${CYAN}DOMAINNAME$ENDCOLOR with ${GREEN}$DOMAINNAME$ENDCOLOR"
fi

if sed -i "s/TOKENID/$TOKENID/" "$APPPATH/duck.sh"  || \
    { echo -e "${RED}Could not update TOKENID with $TOKENID in $APPPATH/duck.sh$ENDCOLOR"; exit 1; }; then
    echo -e "Updated ${CYAN}TOKENID$ENDCOLOR with ${GREEN}$TOKENID$ENDCOLOR"
fi

#Set permissions on template
if sudo chmod 700 "$APPPATH/duck.sh"; then
    echo "Permissions set on $APPPATH/duck.sh"
fi
