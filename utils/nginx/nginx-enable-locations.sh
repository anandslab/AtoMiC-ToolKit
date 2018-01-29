#!/bin/bash
# shellcheck disable=SC1090
# shellcheck disable=SC2034
# Script Name: AtoMiC Nginx Location Enabler
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${YELLOW}--->configuring Nginx Location Enabler $ENDCOLOR"

EnableDisableNginxLocations()
{
    # Does the App dir exist?
    if [[ -d $1 ]]; then
        # Create the symlink
        if [[ ! -f "/etc/nginx/locations-enabled/$2.atomic.conf" ]]; then
            if sudo ln -s "/etc/nginx/locations-available/$2.atomic.conf" \
                "/etc/nginx/locations-enabled/$2.atomic.conf"; then
                echo "Symlinked $2 location"
            fi
        fi
    # If the symlink exists remove it.
    elif [[ -f "/etc/nginx/locations-enabled/$2.atomic.conf" ]]; then
        sudo rm "/etc/nginx/locations-enabled/$2.atomic.conf"
        echo "Removed Symlink for $2 location"
    fi 
}

# couchpotato
# Deluge
# emby
# glances
# grafana
# headphones
# htpc manager

# jackett
EnableDisableNginxLocations '/opt/jackett' 'jackett'

# lazy librarian
# madsonic
# medusa

# muximux
EnableDisableNginxLocations '/var/www/muximux' 'muximux'

# mylar
# netdata
# nzbget
# nzbhydra
# ombi
# organizr
# plex
# plexpy
# pyload
# qbittorrent
# radarr
# resilio-sync
# rutorrent
# sabnzbdplus
# sickgear
# sickrage
# sonarr
# subsonic
# syncthing
# transmission webui
# ubooquity
# watcher
# webmin
