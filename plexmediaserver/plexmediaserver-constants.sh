#!/bin/bash
APPNAME='plexmediaserver'
APPSHORTNAME='plex'
APPPATH='/var/lib/plexmediaserver'
APPTITLE='Plex Media Server'
APPDPORT='32400'
APPSETTINGSDIR='/var/lib/plexmediaserver/Library/Application Support/Plex Media Server'
APPSETTINGS='NA'
REPOPPA='NO'
REPOKEYSREQ='YES'
APPREPOSITORYNAME='plexmediaserver'
ACCESSHOST='NA'
PORTSEARCH='NA'
USERSEARCH='NA'
PASSSEARCH='NA'
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='plexmediaserver.service'
APPSYSTEMDOVERIDE="$SCRIPTPATH/plexmediaserver/plexmediaserver-override.conf"
