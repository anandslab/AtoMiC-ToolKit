#!/bin/bash
# shellcheck disable=SC1090
echo
echo -e "${YELLOW}--->configuring NGINX $ENDCOLOR"

sudo chmod 755 -R /var/www
sudo chown -R www-data:www-data /var/www
echo "Set the correct folder permissions"

cp "$SCRIPTPATH/utils/nginx/$APPSETTINGS" \
    "/etc/nginx/sites-available/$APPSETTINGS" || \
    { echo "${RED}Could not move $APPSETTINGS file.$ENDCOLOR" ; exit 1; }
echo "Copied config file over"

sudo sed -i "s@FPMVERSION@$FPMVERSION@g" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Modifying FPMVERSION in Nginx file failed.$ENDCOLOR"; exit 1; }
echo "Updated config file with correct PHP Version"

sudo sed -i "s@IPADDRESS@$(hostname -I)@g" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Modifying IPADDRESS in Nginx file failed.$ENDCOLOR"; exit 1; }
echo "Updated config file with current IPAddress"

if [[ ! -L "/etc/nginx/sites-enabled/$APPSETTINGS" ]]; then
    sudo ln -s "/etc/nginx/sites-available/$APPSETTINGS" \
                "/etc/nginx/sites-enabled/$APPSETTINGS"
    echo "Symlinked $APPSETTINGS virtual host"
fi

sudo nginx -s reload
