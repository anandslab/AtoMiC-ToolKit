#!/bin/bash
# shellcheck disable=SC2034
APPNAME='resilio-sync'
APPSHORTNAME='rs'
APPPATH="/var/lib/resilio-sync"
APPTITLE='Resilio Sync'
APPSETTINGSDIR="/home/$UNAME/.config/resilio-sync"
APPSETTINGS="$APPSETTINGSDIR/config.json"
APPDPORT='8888'
APPSYSTEMD='resilio-sync.service'
APPREPOSITORYNAME='resilio-sync'
ACCESSHOST='NA'
PORTSEARCH='NA'
APPSYSTEMDOVERIDE="$SCRIPTPATH/resilio-sync/resilio-sync-override.conf"
APPINITD='resilio-sync'
