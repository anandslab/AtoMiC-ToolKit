#!/bin/bash
echo -e "${GREEN}AtoMiC Duck DNS Cron Job manual run Script$ENDCOLOR"

echo
if [[ -f "$APPPATH/duck.sh" ]]; then
    source "$APPPATH/duck.sh"

    if [[ $(cat "$APPPATH/duck.log") == 'OK' ]]; then
        echo -e "${GREEN}Successfully updated IP on Duck DNS$ENDCOLOR"
    else
        echo -e "${RED}Failed to update IP on Duck DNS. Please check you've entered your details correctly.$ENDCOLOR"
    fi
else
    echo -e "${RED}Unable to find the Duck DNS Cron Job script. Please try reinstalling Duck DNS.$ENDCOLOR"
fi
