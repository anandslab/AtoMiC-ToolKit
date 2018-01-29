#!/bin/bash
# shellcheck disable=SC1090
echo
echo -e "${YELLOW}--->configuring NGINX $ENDCOLOR"

if [[ ! -d /var/www ]]; then
    mkdir /var/www
fi

sudo chmod 755 -R /var/www
sudo chown -R www-data:www-data /var/www
echo "Set the correct folder permissions"

cp -R "$SCRIPTPATH/utils/nginx/locations-available/." \
    "/etc/nginx/locations-available/." || \
    { echo -e "${RED}Could not move location files over.$ENDCOLOR" ; exit 1; }
echo "Copied All supported location files over"

cp "$SCRIPTPATH/utils/nginx/$APPSETTINGS" \
    "/etc/nginx/sites-available/$APPSETTINGS" || \
    { echo -e "${RED}Could not move $APPSETTINGS file.$ENDCOLOR" ; exit 1; }
echo "Copied AtoMiC-ToolKit-configured-sites file over"

sudo sed -i "s@FPMVERSION@$FPMVERSION@g" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Modifying FPMVERSION in Nginx file failed.$ENDCOLOR"; exit 1; }
echo "Updated config file with correct PHP Version"

sudo sed -i "s@IPADDRESS@$(hostname -I)@g" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Modifying IPADDRESS in Nginx file failed.$ENDCOLOR"; exit 1; }
echo "Updated config file with current IPADDRESS"

sudo sed -i "s@HOSTNAME@$(hostname)@g" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Modifying HOSTNAME in Nginx file failed.$ENDCOLOR"; exit 1; }
echo "Updated config file with current HOSTNAME"

if [[ ! -L "/etc/nginx/sites-enabled/$APPSETTINGS" ]]; then
    sudo ln -s "/etc/nginx/sites-available/$APPSETTINGS" \
                "/etc/nginx/sites-enabled/$APPSETTINGS"
    echo "Symlinked $APPSETTINGS virtual host"
fi

#Copy over the previous nginx.conf so we get the default settings for the hardware\distro.
if [[ ! -f /etc/nginx/nginx.conf ]]; then
    cat "$SCRIPTPATH/utils/nginx/nginx.conf" > /etc/nginx/nginx.conf || \
    { echo -e "${RED}Could not update nginx.conf file.$ENDCOLOR" ; exit 1; }
    echo "Updated nginx.conf file with previous version"
else

if ! grep -q "etc/nginx/sites-enabled" "/etc/nginx/nginx.conf"; then
    sed -i "\$i \\ \\ \\ \\ include\\ /etc/nginx/sites-enabled/*;" /etc/nginx/nginx.conf
fi

fi
source "$SCRIPTPATH/inc/app-start.sh"
sudo nginx -s reload
