#!/bin/bash

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

if [[ ! -d /etc/nginx/snippets ]]; then
    mkdir /etc/nginx/snippets
fi

find /var/www -type d -print0 | sudo xargs -0 chmod 755
find /var/www -type f -print0 | sudo xargs -0 chmod 644
sudo chown -R www-data:www-data /var/www
echo "Set the correct folder permissions on /var/www for user www-data"

########## AtoMiC-ToolKit Snippets ##########
# Copy any missing snippet files over but doesnt enable them.
for f in "$SCRIPTPATH"/utils/nginx/snippets/*.conf; do
    filename=$(basename $f)
    if [[ ! -f /etc/nginx/snippets/$filename ]]; then
        if cp $f "/etc/nginx/snippets/$filename" || \
            { echo -e "${RED}Could not move snippet file $filename over.$ENDCOLOR"; exit 1; }; then
            echo "Snippet file $filename copied over"
        fi
    fi
done

# Set the correct FPMVERSION in php.atomic.conf.
if [[ -f "/etc/nginx/snippets/php.atomic.conf" ]]; then
    if sudo sed -i "s@fastcgi_pass [^;]*;@fastcgi_pass unix:/var/run/php/$FPMVERSION.sock;@g" \
        "/etc/nginx/snippets/php.atomic.conf" || \
        { echo -e "${RED}Modifying FPMVERSION in Nginx file failed.$ENDCOLOR"; exit 1; }; then
        echo -e "Updated config file with correct PHP Version $CYAN$FPMVERSION$ENDCOLOR"
    fi
fi

########## AtoMiC-ToolKit server.atomic.conf ##########
# Remove old AtoMiC-ToolKit-configured-sites symlink.
if [[ -L "/etc/nginx/sites-enabled/AtoMiC-ToolKit-configured-sites" ]]; then
    if sudo rm "/etc/nginx/sites-enabled/AtoMiC-ToolKit-configured-sites" || \
        { echo -e "${RED}Could not remove symlink AtoMiC-ToolKit-configured-sites. $ENDCOLOR"; exit 1; }; then
        echo "Removed AtoMiC-ToolKit-configured-sites symlink"
    fi
fi

# Rename old AtoMiC-ToolKit-configured-sites to server.atomic.conf if found.
if [[ -f "/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites" ]]; then
    if sudo mv "/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Could not rename AtoMiC-ToolKit-configured-sites to $APPSETTINGS. $ENDCOLOR"; exit 1; }; then
        echo "Renamed AtoMiC-ToolKit-configured-sites to $APPSETTINGS"
    fi
fi

# Copy the server.atomic.conf file if needed.
if [[ ! -f "/etc/nginx/sites-available/$APPSETTINGS" ]] || ! grep -q "#\\ Version=2.1" "/etc/nginx/sites-available/$APPSETTINGS"; then
    if  cp "$SCRIPTPATH/utils/nginx/sites-available/$APPSETTINGS" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Could not move $APPSETTINGS file.$ENDCOLOR"; exit 1; }; then
        echo "Copied $APPSETTINGS file over"
    fi

    if sudo sed -i "s@IPADDRESS@$(hostname -I | cut -d" " -f1)@g" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Modifying IPADDRESS in Nginx file failed.$ENDCOLOR"; exit 1; }; then
        echo -e "Updated config file with current IPADDRESS with $CYAN$(hostname -I | cut -d" " -f1)$ENDCOLOR"
    fi

    if sudo sed -i "s@HOSTNAME@$(hostname)@g" \
        "/etc/nginx/sites-available/$APPSETTINGS" || \
        { echo -e "${RED}Modifying HOSTNAME in Nginx file failed.$ENDCOLOR"; exit 1; }; then
        echo -e "Updated config file with current HOSTNAME with $CYAN$(hostname)$ENDCOLOR"
    fi
fi

# Symlink the AtoMiC-ToolKit server.atomic.conf to enable it.
if [[ ! -L "/etc/nginx/sites-enabled/$APPSETTINGS" ]]; then
    if sudo ln -s "/etc/nginx/sites-available/$APPSETTINGS" \
                "/etc/nginx/sites-enabled/$APPSETTINGS" || \
        { echo -e "${RED}Could not symlink $APPSETTINGS virtual host. $ENDCOLOR"; exit 1; }; then
        echo "Symlinked $APPSETTINGS virtual host"
    fi
fi

########## AtoMiC-ToolKit Locations Available ##########
# Copy any missing location files over but doesnt enable them.
for f in "$SCRIPTPATH"/utils/nginx/locations-available/*.conf; do
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
