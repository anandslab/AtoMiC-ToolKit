#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Integration Test Application Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
CI='YES'
mkdir "./tmp"

echo "Agreed to disclaimers: $(date)" >> "./tmp/consented"
echo "UNAME=root" >> "./tmp/userinfo"
echo "UGROUP=root" >> "./tmp/userinfo"
sudo bash setup.sh -i couchpotato
sudo bash setup.sh -i deluged
sudo bash setup.sh -i emby-server
sudo bash setup.sh -i headphones
sudo bash setup.sh -i htpcmanager
sudo bash setup.sh -i jackett
sudo bash setup.sh -i kodi
sudo bash setup.sh -i lazylibrarian
sudo bash setup.sh -i madsonic
sudo bash setup.sh -i mylar
sudo bash setup.sh -i nzbget
sudo bash setup.sh -i nzbhydra
sudo bash setup.sh -i ombi
sudo bash setup.sh -i plexmediaserver
sudo bash setup.sh -i plexpy
sudo bash setup.sh -i pyload
sudo bash setup.sh -i qbittorrent-nox
sudo bash setup.sh -i radarr
sudo bash setup.sh -i sabnzbdplus
sudo bash setup.sh -i sickgear
sudo bash setup.sh -i sickrage
sudo bash setup.sh -i sonarr
sudo bash setup.sh -i transmission-daemon
sudo bash setup.sh -i watcher
sudo bash setup.sh -i webmin
