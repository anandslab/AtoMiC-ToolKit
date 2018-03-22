#!/bin/bash
echo
echo -e "$YELLOW--->Enablinging Duck DNS in ATK Sites conf...$ENDCOLOR"
ATKCONFFILE='/etc/nginx/sites-available/server.atomic.conf'
# Check if the sites file is present
if [[ -f $ATKCONFFILE ]]; then
    for i in ${DOMAINNAME//,/ }; do
    # Loop each of the duckdns domains and add it
        if [[ ! -L "/etc/nginx/sites-enabled/$i.duckdns.org.conf" ]]; then
            if [[ ! -f "/etc/nginx/sites-available/$i.duckdns.org.conf" ]]; then
                sudo cp $ATKCONFFILE "/etc/nginx/sites-available/$i.duckdns.org.conf"
                if sudo sed -i "s@server_name [^;]*;@server_name $i.duckdns.org;@g" \
                    "/etc/nginx/sites-available/$i.duckdns.org.conf" || \
                    { echo -e "${RED}Could not properly set server_name in /etc/nginx/sites-available/$i.duckdns.org.conf.$ENDCOLOR"; exit 1; }; then
                    echo -e "$CYAN$i.duckdns.org$ENDCOLOR inserted into $CYAN/etc/nginx/sites-available/$i.duckdns.org.conf$ENDCOLOR"
                fi
            fi
            # Symlink the .duckdns.org.conf to enable it.
            if sudo ln -s "/etc/nginx/sites-available/$i.duckdns.org.conf" \
                        "/etc/nginx/sites-enabled/$i.duckdns.org.conf" || \
                { echo -e "${RED}Could not symlink $i.duckdns.org.conf virtual host. $ENDCOLOR"; exit 1; }; then
                echo "Symlinked $i.duckdns.org.conf virtual host"
            fi

        fi
    done
else
    echo -e "${RED}$ATKCONFFILE not found. \
Please install NGINX or you will need to configure your webserer software manually.$ENDCOLOR"
fi
echo
