#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC1090
# Script Name: AtoMiC Integration Test Application Install Uninstall
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
source "$SCRIPTPATH/setup.sh" -u couchpotato
source "$SCRIPTPATH/setup.sh" -i deluged
source "$SCRIPTPATH/setup.sh" -u deluged
source "$SCRIPTPATH/setup.sh" -i emby-server
source "$SCRIPTPATH/setup.sh" -u emby-server
source "$SCRIPTPATH/setup.sh" -i glances
source "$SCRIPTPATH/setup.sh" -u glances
source "$SCRIPTPATH/setup.sh" -i grafana
source "$SCRIPTPATH/setup.sh" -u grafana
source "$SCRIPTPATH/setup.sh" -i headphones
source "$SCRIPTPATH/setup.sh" -u headphones
source "$SCRIPTPATH/setup.sh" -i htpcmanager
source "$SCRIPTPATH/setup.sh" -u htpcmanager
source "$SCRIPTPATH/setup.sh" -i jackett
source "$SCRIPTPATH/setup.sh" -u jackett
# source "$SCRIPTPATH/setup.sh" -i kodi
# source "$SCRIPTPATH/setup.sh" -u kodi
source "$SCRIPTPATH/setup.sh" -i lazylibrarian
source "$SCRIPTPATH/setup.sh" -u lazylibrarian
source "$SCRIPTPATH/setup.sh" -i madsonic
source "$SCRIPTPATH/setup.sh" -u madsonic
source "$SCRIPTPATH/setup.sh" -i muximux
source "$SCRIPTPATH/setup.sh" -u muximux
source "$SCRIPTPATH/setup.sh" -i mylar
source "$SCRIPTPATH/setup.sh" -u mylar
source "$SCRIPTPATH/setup.sh" -i nzbget
source "$SCRIPTPATH/setup.sh" -u nzbget
source "$SCRIPTPATH/setup.sh" -i netdata
source "$SCRIPTPATH/setup.sh" -u netdata
source "$SCRIPTPATH/setup.sh" -i nzbhydra
source "$SCRIPTPATH/setup.sh" -u nzbhydra
source "$SCRIPTPATH/setup.sh" -i ombi
source "$SCRIPTPATH/setup.sh" -u ombi
source "$SCRIPTPATH/setup.sh" -i organizr
source "$SCRIPTPATH/setup.sh" -u organizr
source "$SCRIPTPATH/setup.sh" -i phpsysinfo
source "$SCRIPTPATH/setup.sh" -u phpsysinfo
source "$SCRIPTPATH/setup.sh" -i plexmediaserver
source "$SCRIPTPATH/setup.sh" -u plexmediaserver
source "$SCRIPTPATH/setup.sh" -i plexpy
source "$SCRIPTPATH/setup.sh" -u plexpy
source "$SCRIPTPATH/setup.sh" -i pyload
source "$SCRIPTPATH/setup.sh" -u pyload
source "$SCRIPTPATH/setup.sh" -i qbittorrent-nox
source "$SCRIPTPATH/setup.sh" -u qbittorrent-nox
source "$SCRIPTPATH/setup.sh" -i radarr
source "$SCRIPTPATH/setup.sh" -u radarr
source "$SCRIPTPATH/setup.sh" -i resilio-sync
source "$SCRIPTPATH/setup.sh" -u resilio-sync
source "$SCRIPTPATH/setup.sh" -i rtorrent
source "$SCRIPTPATH/setup.sh" -u rtorrent
source "$SCRIPTPATH/setup.sh" -i rutorrent
source "$SCRIPTPATH/setup.sh" -u rutorrent
source "$SCRIPTPATH/setup.sh" -i sabnzbdplus
source "$SCRIPTPATH/setup.sh" -u sabnzbdplus
source "$SCRIPTPATH/setup.sh" -i sickgear
source "$SCRIPTPATH/setup.sh" -u sickgear
source "$SCRIPTPATH/setup.sh" -i sickrage
source "$SCRIPTPATH/setup.sh" -u sickrage
source "$SCRIPTPATH/setup.sh" -i sonarr
source "$SCRIPTPATH/setup.sh" -u sonarr
source "$SCRIPTPATH/setup.sh" -i subsonic
source "$SCRIPTPATH/setup.sh" -u subsonic
source "$SCRIPTPATH/setup.sh" -i syncthing
source "$SCRIPTPATH/setup.sh" -u syncthing
source "$SCRIPTPATH/setup.sh" -i transmission-daemon
source "$SCRIPTPATH/setup.sh" -u transmission-daemon
source "$SCRIPTPATH/setup.sh" -i ubooquity
source "$SCRIPTPATH/setup.sh" -u ubooquity
source "$SCRIPTPATH/setup.sh" -i watcher
source "$SCRIPTPATH/setup.sh" -u watcher
source "$SCRIPTPATH/setup.sh" -i webmin
source "$SCRIPTPATH/setup.sh" -u webmin
source "$SCRIPTPATH/inc/thankyou.sh"