#!/bin/bash

echo
echo -e "${YELLOW}--->configuring NGINX Sites based on old AtoMiC-ToolKit-configured-sites$ENDCOLOR"

server_name=$(grep '  server_name' /etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites | xargs | cut -d" " -f2- | sed 's/\;//g')
for address in $server_name ; do
    if [[ ! $address =~ ^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}$ ]] && [[ $address != $(hostname) ]]; then
        source "$SCRIPTPATH/utils/nginx/nginx-domain-add.sh" "$address"
    fi
done
