#!/bin/bash
# Script Name: AtoMiC Batch Application Install Uninstall

source "$SCRIPTPATH/setup.sh" -i muximux
source "$SCRIPTPATH/setup.sh" -u muximux
source "$SCRIPTPATH/setup.sh" -i organizr
source "$SCRIPTPATH/setup.sh" -u organizr
source "$SCRIPTPATH/setup.sh" -i phpsysinfo
source "$SCRIPTPATH/setup.sh" -u phpsysinfo
source "$SCRIPTPATH/setup.sh" -i rutorrent
source "$SCRIPTPATH/setup.sh" -u rutorrent

source "$SCRIPTPATH/setup.sh" -i couchpotato
source "$SCRIPTPATH/setup.sh" -x couchpotato
source "$SCRIPTPATH/setup.sh" -u couchpotato
source "$SCRIPTPATH/setup.sh" -i deluged
# source "$SCRIPTPATH/setup.sh" -x deluged
source "$SCRIPTPATH/setup.sh" -u deluged
source "$SCRIPTPATH/setup.sh" -i filebot
source "$SCRIPTPATH/setup.sh" -u filebot
source "$SCRIPTPATH/setup.sh" -i emby-server
# source "$SCRIPTPATH/setup.sh" -x emby-server
source "$SCRIPTPATH/setup.sh" -u emby-server
source "$SCRIPTPATH/setup.sh" -i glances
# source "$SCRIPTPATH/setup.sh" -x glances
source "$SCRIPTPATH/setup.sh" -u glances
source "$SCRIPTPATH/setup.sh" -i grafana
# source "$SCRIPTPATH/setup.sh" -x grafana
source "$SCRIPTPATH/setup.sh" -u grafana
source "$SCRIPTPATH/setup.sh" -i headphones
# source "$SCRIPTPATH/setup.sh" -x headphones
source "$SCRIPTPATH/setup.sh" -u headphones
# source "$SCRIPTPATH/setup.sh" -i htpcmanager
# source "$SCRIPTPATH/setup.sh" -x htpcmanager
# source "$SCRIPTPATH/setup.sh" -u htpcmanager
# source "$SCRIPTPATH/setup.sh" -i jackett
# source "$SCRIPTPATH/setup.sh" -x jackett
# source "$SCRIPTPATH/setup.sh" -u jackett
# source "$SCRIPTPATH/setup.sh" -i kodi
# source "$SCRIPTPATH/setup.sh" -u kodi
# source "$SCRIPTPATH/setup.sh" -i lazylibrarian # Init.d script broken
# source "$SCRIPTPATH/setup.sh" -x lazylibrarian
# source "$SCRIPTPATH/setup.sh" -u lazylibrarian
source "$SCRIPTPATH/setup.sh" -i madsonic
# source "$SCRIPTPATH/setup.sh" -x madsonic
source "$SCRIPTPATH/setup.sh" -u madsonic
source "$SCRIPTPATH/setup.sh" -i medusa
# source "$SCRIPTPATH/setup.sh" -x medusa
source "$SCRIPTPATH/setup.sh" -u medusa
source "$SCRIPTPATH/setup.sh" -i mylar
# source "$SCRIPTPATH/setup.sh" -x mylar
source "$SCRIPTPATH/setup.sh" -u mylar
source "$SCRIPTPATH/setup.sh" -i nzbget
# source "$SCRIPTPATH/setup.sh" -x nzbget
source "$SCRIPTPATH/setup.sh" -u nzbget
# source "$SCRIPTPATH/setup.sh" -i netdata
# source "$SCRIPTPATH/setup.sh" -x netdata
# source "$SCRIPTPATH/setup.sh" -u netdata
source "$SCRIPTPATH/setup.sh" -i nzbhydra
# source "$SCRIPTPATH/setup.sh" -x nzbhydra
source "$SCRIPTPATH/setup.sh" -u nzbhydra
# source "$SCRIPTPATH/setup.sh" -i ombi
# source "$SCRIPTPATH/setup.sh" -x ombi # Should work however stops and starts to quickly so fails so needs further investigation.
# source "$SCRIPTPATH/setup.sh" -u ombi
source "$SCRIPTPATH/setup.sh" -i plexmediaserver
# source "$SCRIPTPATH/setup.sh" -x plexmediaserver
source "$SCRIPTPATH/setup.sh" -u plexmediaserver
source "$SCRIPTPATH/setup.sh" -i pyload
# source "$SCRIPTPATH/setup.sh" -x pyload
source "$SCRIPTPATH/setup.sh" -u pyload
source "$SCRIPTPATH/setup.sh" -i qbittorrent-nox
# source "$SCRIPTPATH/setup.sh" -x qbittorrent-nox
source "$SCRIPTPATH/setup.sh" -u qbittorrent-nox
source "$SCRIPTPATH/setup.sh" -i radarr
# source "$SCRIPTPATH/setup.sh" -x radarr
source "$SCRIPTPATH/setup.sh" -u radarr
source "$SCRIPTPATH/setup.sh" -i rclone
source "$SCRIPTPATH/setup.sh" -u rclone
source "$SCRIPTPATH/setup.sh" -i rclone-browser
source "$SCRIPTPATH/setup.sh" -u rclone-browser
source "$SCRIPTPATH/setup.sh" -i resilio-sync
# source "$SCRIPTPATH/setup.sh" -x resilio-sync
source "$SCRIPTPATH/setup.sh" -u resilio-sync
source "$SCRIPTPATH/setup.sh" -i rtorrent
source "$SCRIPTPATH/setup.sh" -u rtorrent
source "$SCRIPTPATH/setup.sh" -i sabnzbdplus
# source "$SCRIPTPATH/setup.sh" -x sabnzbdplus
source "$SCRIPTPATH/setup.sh" -u sabnzbdplus
source "$SCRIPTPATH/setup.sh" -i sickgear
# source "$SCRIPTPATH/setup.sh" -x sickgear
source "$SCRIPTPATH/setup.sh" -u sickgear
source "$SCRIPTPATH/setup.sh" -i sickrage
# source "$SCRIPTPATH/setup.sh" -x sickrage
source "$SCRIPTPATH/setup.sh" -u sickrage
source "$SCRIPTPATH/setup.sh" -i sonarr
# source "$SCRIPTPATH/setup.sh" -x sonarr
source "$SCRIPTPATH/setup.sh" -u sonarr
source "$SCRIPTPATH/setup.sh" -i subsonic
# source "$SCRIPTPATH/setup.sh" -x subsonic
source "$SCRIPTPATH/setup.sh" -u subsonic
source "$SCRIPTPATH/setup.sh" -i syncthing
# source "$SCRIPTPATH/setup.sh" -x syncthing
source "$SCRIPTPATH/setup.sh" -u syncthing
source "$SCRIPTPATH/setup.sh" -i tautulli
# source "$SCRIPTPATH/setup.sh" -x tautulli
source "$SCRIPTPATH/setup.sh" -u tautulli
source "$SCRIPTPATH/setup.sh" -i transmission-daemon
# source "$SCRIPTPATH/setup.sh" -x transmission-daemon
source "$SCRIPTPATH/setup.sh" -u transmission-daemon
source "$SCRIPTPATH/setup.sh" -i ubooquity
APPDPORT='2203/ubooquity/admin'
# source "$SCRIPTPATH/setup.sh" -x ubooquity
source "$SCRIPTPATH/setup.sh" -u ubooquity
source "$SCRIPTPATH/setup.sh" -i watcher
# source "$SCRIPTPATH/setup.sh" -x watcher
source "$SCRIPTPATH/setup.sh" -u watcher
source "$SCRIPTPATH/setup.sh" -i webmin
# source "$SCRIPTPATH/setup.sh" -x webmin
source "$SCRIPTPATH/setup.sh" -u webmin
source "$SCRIPTPATH/inc/thankyou.sh"
