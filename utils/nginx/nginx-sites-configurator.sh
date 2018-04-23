#!/bin/bash
# Script Name: AtoMiC Nginx Sites Configurator

echo
echo -e "${YELLOW}--->configuring Nginx Sites $ENDCOLOR"

# Remove old AtoMiC-ToolKit-configured-sites symlink.
if [[ -L "/etc/nginx/sites-enabled/AtoMiC-ToolKit-configured-sites" ]]; then
    if sudo rm "/etc/nginx/sites-enabled/AtoMiC-ToolKit-configured-sites" || \
            { echo -e "${RED}Could not remove symlink AtoMiC-ToolKit-configured-sites. $ENDCOLOR"; exit 1; }; then
            echo "Removed AtoMiC-ToolKit-configured-sites symlink"
        SITESCHANGEREQ=1
    fi
fi

# Rename the Old Sites file if it exists to make it clear its not used anymore.
if [[ -f "/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites" ]]; then

    # this will create any new required sites found in the server_name.
    source "$SCRIPTPATH/utils/nginx/nginx-server_name-site-creator.sh"

    if sudo mv "/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites" "/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites.old" || \
            { echo -e "${RED}Could not rename AtoMiC-ToolKit-configured-sites. $ENDCOLOR"; exit 1; }; then
            echo "Renamed AtoMiC-ToolKit-configured-sites to AtoMiC-ToolKit-configured-sites.old"
        SITESCHANGEREQ=1
    fi
fi

# Copy the server.atomic.conf file if needed.
if [[ ! -f "/etc/nginx/sites-available/$APPSETTINGS" ]] || \
        ! grep -q "#\\ Version=2.1" "/etc/nginx/sites-available/$APPSETTINGS"; then

    if  cp "$SCRIPTPATH/utils/nginx/sites-available/$APPSETTINGS" \
            "/etc/nginx/sites-available/$APPSETTINGS" || \
            { echo -e "${RED}Could not move $APPSETTINGS file.$ENDCOLOR"; exit 1; }; then
        echo "Copied $APPSETTINGS file over"
        SITESCHANGEREQ=1
    fi

    if ReplaceString "IPADDRESS" "$(hostname -I | cut -d" " -f1)" "/etc/nginx/sites-available/$APPSETTINGS"; then
        SITESCHANGEREQ=1
    fi

    if ReplaceString "HOSTNAME" "$(hostname)" "/etc/nginx/sites-available/$APPSETTINGS"; then
        SITESCHANGEREQ=1
    fi
fi

# Symlink the AtoMiC-ToolKit server.atomic.conf to enable it.
if [[ ! -L "/etc/nginx/sites-enabled/$APPSETTINGS" ]]; then
    if sudo ln -s "/etc/nginx/sites-available/$APPSETTINGS" \
            "/etc/nginx/sites-enabled/$APPSETTINGS" || \
            { echo -e "${RED}Could not symlink $APPSETTINGS virtual host. $ENDCOLOR"; exit 1; }; then
        echo "Symlinked $APPSETTINGS virtual host"
        SITESCHANGEREQ=1
    fi
fi

if [[ -z $SITESCHANGEREQ ]]; then
    echo 'No changes required'
    SITESCHANGEREQ=''
fi
