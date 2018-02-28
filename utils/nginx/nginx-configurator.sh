#!/bin/bash
# shellcheck disable=SC1090
echo
echo -e "${YELLOW}--->configuring NGINX $ENDCOLOR"

if [[ ! -d /var/www ]]; then
    mkdir /var/www
fi

if [[ ! -d /etc/nginx/sites-available ]]; then
    mkdir /etc/nginx/sites-available
fi

if [[ ! -d /etc/nginx/sites-enabled ]]; then
    mkdir /etc/nginx/sites-enabled
fi

if [[ ! -d /etc/nginx/locations-available ]]; then
    mkdir /etc/nginx/locations-available
fi

if [[ ! -d /etc/nginx/locations-enabled ]]; then
    mkdir /etc/nginx/locations-enabled
fi

sudo chmod 755 -R /var/www
sudo chown -R www-data:www-data /var/www
echo "Set the correct folder permissions on /var/www for user www-data"

########## AtoMiC-ToolKit-configured-sites ##########
if [[ ! -f "/etc/nginx/sites-available/$APPSETTINGS" ]] || ! grep -q "#\\ Version=2.0" "/etc/nginx/sites-available/$APPSETTINGS"; then
    if  cp "$SCRIPTPATH/utils/nginx/$APPSETTINGS" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Could not move $APPSETTINGS file.$ENDCOLOR"; exit 1; }; then
        echo "Copied AtoMiC-ToolKit-configured-sites file over"
    fi

    if sudo sed -i "s@FPMVERSION@$FPMVERSION@g" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Modifying FPMVERSION in Nginx file failed.$ENDCOLOR"; exit 1; }; then
        echo "Updated config file with correct PHP Version"
    fi

    if sudo sed -i "s@IPADDRESS@$(hostname -I)@g" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Modifying IPADDRESS in Nginx file failed.$ENDCOLOR"; exit 1; }; then
        echo "Updated config file with current IPADDRESS"
    fi

    if sudo sed -i "s@HOSTNAME@$(hostname)@g" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Modifying HOSTNAME in Nginx file failed.$ENDCOLOR"; exit 1; }; then
        echo "Updated config file with current HOSTNAME"
    fi
fi

# Symlink the AtoMiC-ToolKit-configured-sites to enable it.
if [[ ! -L "/etc/nginx/sites-enabled/$APPSETTINGS" ]]; then
    if sudo ln -s "/etc/nginx/sites-available/$APPSETTINGS" \
                "/etc/nginx/sites-enabled/$APPSETTINGS"  || \
        { echo -e "${RED}Could not symlink $APPSETTINGS virtual host. $ENDCOLOR"; exit 1; }; then
        echo "Symlinked $APPSETTINGS virtual host"
    fi
fi

########## AtoMiC-ToolKit Locations Available ##########
# Copies any missing location files over but doesnt enable them.
for f in $SCRIPTPATH/utils/nginx/locations-available/*.conf; do
    filename=$(basename $f)
    if [[ ! -f /etc/nginx/locations-available/$filename ]]; then
        if cp $f "/etc/nginx/locations-available/$filename" || \
            { echo -e "${RED}Could not move location file $filename over.$ENDCOLOR"; exit 1; }; then
            echo "Location file $filename copied over"
        fi
    fi
done

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
        { echo -e "${RED}Could not Create new nginx.conf file.$ENDCOLOR"; exit 1; }; then
        echo "Created new nginx.conf file"
    fi
fi

source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/utils/nginx/nginx-reload.sh"
