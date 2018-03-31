#!/bin/bash
# Script Name: AtoMiC Batch Test Application Update

source "$SCRIPTPATH/setup.sh" -m aria2
source "$SCRIPTPATH/setup.sh" -m aria2-webui
source "$SCRIPTPATH/setup.sh" -m couchpotato
source "$SCRIPTPATH/setup.sh" -m deluged
source "$SCRIPTPATH/setup.sh" -m emby-server
source "$SCRIPTPATH/setup.sh" -m filebot
source "$SCRIPTPATH/setup.sh" -m glances
source "$SCRIPTPATH/setup.sh" -m grafana
source "$SCRIPTPATH/setup.sh" -m headphones
source "$SCRIPTPATH/setup.sh" -m htpcmanager
source "$SCRIPTPATH/setup.sh" -m jackett
source "$SCRIPTPATH/setup.sh" -m kodi
source "$SCRIPTPATH/setup.sh" -m lazylibrarian
source "$SCRIPTPATH/setup.sh" -m madsonic
source "$SCRIPTPATH/setup.sh" -m medusa
source "$SCRIPTPATH/setup.sh" -m muximux
source "$SCRIPTPATH/setup.sh" -m mylar
source "$SCRIPTPATH/setup.sh" -m netdata
# source "$SCRIPTPATH/setup.sh" -m nzbget
source "$SCRIPTPATH/setup.sh" -m nzbhydra
source "$SCRIPTPATH/setup.sh" -m ombi
source "$SCRIPTPATH/setup.sh" -m organizr
source "$SCRIPTPATH/setup.sh" -m phpsysinfo
source "$SCRIPTPATH/setup.sh" -m plexmediaserver
source "$SCRIPTPATH/setup.sh" -m pyload
source "$SCRIPTPATH/setup.sh" -m qbittorrent-nox
source "$SCRIPTPATH/setup.sh" -m radarr
source "$SCRIPTPATH/setup.sh" -m rclone
source "$SCRIPTPATH/setup.sh" -m rclone-browser
source "$SCRIPTPATH/setup.sh" -m resilio-sync
source "$SCRIPTPATH/setup.sh" -m rtorrent
source "$SCRIPTPATH/setup.sh" -m rutorrent
source "$SCRIPTPATH/setup.sh" -m sabnzbdplus
source "$SCRIPTPATH/setup.sh" -m sickgear
source "$SCRIPTPATH/setup.sh" -m sickrage
source "$SCRIPTPATH/setup.sh" -m sonarr
source "$SCRIPTPATH/setup.sh" -m subsonic
source "$SCRIPTPATH/setup.sh" -m syncthing
source "$SCRIPTPATH/setup.sh" -i tautulli
source "$SCRIPTPATH/setup.sh" -m transmission-daemon
source "$SCRIPTPATH/setup.sh" -m ubooquity
source "$SCRIPTPATH/setup.sh" -m watcher
source "$SCRIPTPATH/setup.sh" -m webmin
ARGS=''
CI=''
source "$SCRIPTPATH/inc/thankyou.sh"
