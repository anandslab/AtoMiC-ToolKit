#!/bin/bash
# shellcheck disable=SC1090
echo
echo -e "${YELLOW}--->configuring NGINX $ENDCOLOR"

sudo chown -R www-data:www-data "$APPPATH"
echo "Set the correct folder permissions"

cp "$SCRIPTPATH/utils/AtoMiC-ToolKit-nginx" \
    "/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites" || \
    { echo "${RED}Could not move $APPSETTINGS file.$ENDCOLOR" ; exit 1; }
echo "Copied config file over"

sudo sed -i "s@FPMVERSION@$FPMVERSION@g" \
        "/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites" || \
        { echo -e "${RED}Modifying FPMVERSION in Nginx file failed.$ENDCOLOR"; exit 1; }
echo "Updated config file with correct PHP Version"

sudo sed -i "s@IPADDRESS@$(hostname -I)@g" \
        "/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites" || \
        { echo -e "${RED}Modifying IPADDRESS in Nginx file failed.$ENDCOLOR"; exit 1; }
echo "Updated config file with current IPAddress"

if [[ ! -L "/etc/nginx/sites-enabled/AtoMiC-ToolKit-configured-sites" ]]; then
    sudo ln -s "/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites" \
                "/etc/nginx/sites-enabled/AtoMiC-ToolKit-configured-sites"
    echo "Symlinked AtoMiC-ToolKit-configured-sites virtual host"
fi
