#!/bin/bash
APPNAME='plexmediaserver'
APPSHORTNAME='plex'
APPPATH='/var/lib/plexmediaserver'
APPTITLE='Plex Media Server'
APPDPORT='32400'
APPSETTINGSTYPE='DB'
APPSETTINGSDIR='/var/lib/plexmediaserver/Library/Application Support/Plex Media Server'
APPSETTINGSDB='/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db'
REPOPPA='NO'
REPOKEYSREQ='YES'
APPREPOSITORYNAME='plexmediaserver'
ACCESSHOST='NA'
PORTSEARCH='NA'
DBUSERSEARCH='SELECT name FROM accounts WHERE id = 1;'
DBPASSSEARCH='NA'
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='plexmediaserver.service'
APPSYSTEMDLOC="$SCRIPTPATH/plexmediaserver/plexmediaserver.service" 
APPSYSTEMDOVERIDE="$SCRIPTPATH/plexmediaserver/plexmediaserver-override.conf"
APPINITD='plexmediaserver'
