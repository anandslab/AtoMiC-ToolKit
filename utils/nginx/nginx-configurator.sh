#!/bin/bash

echo
echo -e "${YELLOW}--->configuring NGINX $ENDCOLOR"

source "$SCRIPTPATH/utils/nginx/nginx-folder-create.sh"
source "$SCRIPTPATH/utils/nginx/nginx-snippets-configurator.sh"
source "$SCRIPTPATH/utils/nginx/nginx-sites-configurator.sh"
source "$SCRIPTPATH/utils/nginx/nginx-locations-configurator.sh"

# See if the nginx file is what ATK requires. If not backup and copy over the correct one.
if ! grep -q "#\\ Version=1.0" /etc/nginx/nginx.conf; then
    if mv /etc/nginx/nginx.conf /etc/nginx/nginx.old'_'"$(date '+%m-%d-%Y_%H-%M')" || \
        { echo -e "${RED}Could not backup existing nginx.conf file.$ENDCOLOR"; exit 1; }; then
        echo "Backed up existing nginx.conf file"
    fi
fi

#Copy over a nginx.conf so we get the default settings for the hardware\distro.
if [[ ! -f /etc/nginx/nginx.conf ]]; then
    if cat "$SCRIPTPATH/utils/nginx/nginx.conf" > /etc/nginx/nginx.conf || \
        { echo -e "${RED}Could not create new nginx.conf file.$ENDCOLOR"; exit 1; }; then
        echo "Created new nginx.conf file"
    fi
fi

source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/utils/nginx/nginx-reload.sh"
