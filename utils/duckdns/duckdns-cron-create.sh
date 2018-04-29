#!/bin/bash
echo -e "${GREEN}AtoMiC Duck DNS Cron Job Installer Script$ENDCOLOR"

echo

CRONCMD="$APPPATH/duck.sh #DuckDNS"
if crontab -l | grep -q "$CRONCMD" ; then
    echo 'Cron job already exists'
else
    source "$SCRIPTPATH/utils/duckdns/duckdns-questions.sh"

    if [[ -n $DOMAINNAME ]] && [[ -n $TOKENID ]]; then
        source "$SCRIPTPATH/inc/app-folders-create.sh"
        source "$SCRIPTPATH/utils/duckdns/duckdns-template-configure.sh"
        echo
        echo -e "$YELLOW--->Creating Duck DNS Cron Job...$ENDCOLOR"

        source "$SCRIPTPATH/inc/crontab-handler.sh"
        AddCronTab

        for Domain in ${DOMAINNAME//,/ }; do
            # Loop each of the duckdns domains and add it
            source "$SCRIPTPATH/utils/nginx/nginx-domain-add.sh" "$Domain.duckdns.org"
        done

        echo
        source "$APPPATH/duck.sh"

        if [[ $(cat "$APPPATH/duck.log") == 'OK' ]]; then
            echo -e "${GREEN}Successfully updated IP on Duck DNS$ENDCOLOR"
            echo
            LANIP=$(hostname -I | cut -d" " -f1)
            LANIP=${LANIP//[[:blank:]]/}
            echo -e "$YELLOW--->Port forward info...$ENDCOLOR"
            echo -e "You will now need to enable port forwarding on your router for ports 80 and 443 to your local ip: ${GREEN}$LANIP$ENDCOLOR."
            echo -e "For more information on how to do this please try visiting ${CYAN}https://portforward.com$ENDCOLOR, Find your router and set the application type to Apache."
        else
            echo -e "${RED}Failed to update IP on Duck DNS. Please check you've entered your details correctly.$ENDCOLOR"
        fi
        echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
    fi
fi
