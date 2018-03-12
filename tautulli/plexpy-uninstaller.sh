#!/bin/bash
# Script Name: AtoMiC PlexPy Uninstaller
echo
echo -e "${GREEN}--->Plexpy Upgrade and Removal...$ENDCOLOR"

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/tautulli/plexpy-constants.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
echo

if [[ -f "$APPSETTINGS" && -d /opt/Tautulli ]]; then
    if sudo cp /opt/plexpy/config.ini /opt/Tautulli/config.ini || \
            { echo -e "${RED}Conf file not copied.$ENDCOLOR" ; exit 1; }; then
        echo -e "Copied over /opt/plexpy/config.ini to /opt/Tautulli/config.ini"
    fi

    if sed -i "s/plexpy/Tautulli/gI" /opt/Tautulli/config.ini; then
        echo "Updated plexpy to Tautulli references in /opt/Tautulli/config.ini"
    fi

    if sed -i "s/Tautulli_auto_update/plexpy_auto_update/" /opt/Tautulli/config.ini; then
        echo "Updated plexpy_auto_update in /opt/Tautulli/config.ini"
    fi
fi

if [[ -f "$APPSETTINGSDB" && -d /opt/Tautulli ]]; then
    if sudo cp /opt/plexpy/plexpy.db /opt/Tautulli/plexpy.db || \
            { echo -e "${RED}Conf file not copied.$ENDCOLOR" ; exit 1; }; then
        echo -e "Copied over /opt/plexpy/plexpy.db to /opt/Tautulli/plexpy.db which will get renamed on the first start."
    fi
fi

if [[ -L /etc/nginx/locations-enabled/plexpy.atomic.conf ]]; then
    if sudo rm /etc/nginx/locations-enabled/plexpy.atomic.conf || \
            { echo -e "${RED}Failed to remove /etc/nginx/locations-enabled/plexpy.atomic.conf.$ENDCOLOR" ; exit 1; }; then
        echo -e "Old /etc/nginx/locations-enabled/plexpy.atomic.conf removed"
    fi
fi

if [[ -f /etc/nginx/locations-available/plexpy.atomic.conf ]]; then
    if sudo rm /etc/nginx/locations-available/plexpy.atomic.conf || \
            { echo -e "${RED}Failed to remove /etc/nginx/locations-available/plexpy.atomic.conf$ENDCOLOR" ; exit 1; }; then
        echo -e "Old /etc/nginx/locations-available/plexpy.atomic.conf removed"
    fi
fi

source "$SCRIPTPATH/inc/app-file-del.sh"
source "$SCRIPTPATH/inc/app-uninstall-confirmation.sh"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
