#!/bin/bash

echo
echo -e "$YELLOW--->Enabling $1 Sites conf...$ENDCOLOR"
ATKCONFFILE='/etc/nginx/sites-available/server.atomic.conf'
# Check if the sites file is present
if [[ -f $ATKCONFFILE ]]; then

        # If the conf file doesnt exist copy the server.atomic.conf file over with the new domain name.
        if [[ ! -f "/etc/nginx/sites-available/$1.conf" ]]; then
            if sudo cp $ATKCONFFILE "/etc/nginx/sites-available/$1.conf"  || \
                { echo -e "${RED}Could not copy $ATKCONFFILE. $ENDCOLOR"; exit 1; }; then
                echo "Created /etc/nginx/sites-available/$1.conf"
                ReplaceString "  server_name [^;]*;" "  server_name $1;" "/etc/nginx/sites-available/$1.conf"
            fi
        fi
        # Symlink the .conf to enable it.
        if [[ ! -L "/etc/nginx/sites-enabled/$1.conf" ]]; then
            if sudo ln -s "/etc/nginx/sites-available/$1.conf" \
                        "/etc/nginx/sites-enabled/$1.conf" || \
                { echo -e "${RED}Could not symlink $1.conf virtual host. $ENDCOLOR"; exit 1; }; then
                echo "Symlinked $1.conf virtual host"
            fi
        fi
else
    echo -e "${RED}$ATKCONFFILE not found.
Please install NGINX or you will need to configure your webserver software manually.$ENDCOLOR"
fi
echo
