#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC1090
# Script Name: AtoMiC Integration Test Application Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

SCRIPTPATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
CI='YES'
source "$SCRIPTPATH/inc/app-toolkit-deps.sh"
echo
if [[ ! -d $SCRIPTPATH/tmp ]]; then
    mkdir "$SCRIPTPATH/tmp"
fi

if [[ ! -f $SCRIPTPATH/tmp/userinfo ]]; then
    echo "UNAME=$SUDO_USER" > "$SCRIPTPATH/tmp/userinfo"
    echo "UGROUP=$SUDO_USER" >> "$SCRIPTPATH/tmp/userinfo"
fi

if [[ ! -f $SCRIPTPATH/tmp/consented ]]; then
    echo "Agreed to disclaimers: $(date)" > "$SCRIPTPATH/tmp/consented"
fi

source "$SCRIPTPATH/setup.sh" -i couchpotato
source "$SCRIPTPATH/setup.sh" -i deluged
source "$SCRIPTPATH/setup.sh" -i emby-server
source "$SCRIPTPATH/setup.sh" -i glances
source "$SCRIPTPATH/setup.sh" -i grafana
source "$SCRIPTPATH/setup.sh" -i headphones
source "$SCRIPTPATH/setup.sh" -i htpcmanager
source "$SCRIPTPATH/setup.sh" -i jackett
# source "$SCRIPTPATH/setup.sh" -i kodi
source "$SCRIPTPATH/setup.sh" -i lazylibrarian
source "$SCRIPTPATH/setup.sh" -i madsonic
source "$SCRIPTPATH/setup.sh" -i muximux
source "$SCRIPTPATH/setup.sh" -i mylar
source "$SCRIPTPATH/setup.sh" -i nzbget
source "$SCRIPTPATH/setup.sh" -i nzbhydra
source "$SCRIPTPATH/setup.sh" -i ombi
source "$SCRIPTPATH/setup.sh" -i organizr
source "$SCRIPTPATH/setup.sh" -i phpsysinfo
source "$SCRIPTPATH/setup.sh" -i plexmediaserver
source "$SCRIPTPATH/setup.sh" -i plexpy
source "$SCRIPTPATH/setup.sh" -i pyload
source "$SCRIPTPATH/setup.sh" -i qbittorrent-nox
source "$SCRIPTPATH/setup.sh" -i radarr
source "$SCRIPTPATH/setup.sh" -i resilio-sync
source "$SCRIPTPATH/setup.sh" -i rtorrent
source "$SCRIPTPATH/setup.sh" -i rutorrent
source "$SCRIPTPATH/setup.sh" -i sabnzbdplus
source "$SCRIPTPATH/setup.sh" -i sickgear
source "$SCRIPTPATH/setup.sh" -i sickrage
source "$SCRIPTPATH/setup.sh" -i sonarr
source "$SCRIPTPATH/setup.sh" -i subsonic
source "$SCRIPTPATH/setup.sh" -i syncthing
source "$SCRIPTPATH/setup.sh" -i transmission-daemon
source "$SCRIPTPATH/setup.sh" -i ubooquity
source "$SCRIPTPATH/setup.sh" -i watcher
source "$SCRIPTPATH/setup.sh" -i webmin
source "$SCRIPTPATH/inc/thankyou.sh"
