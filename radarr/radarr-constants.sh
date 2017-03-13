#!/bin/bash
APPNAME='radarr'
APPSHORTNAME='radarr'
APPPATH='/opt/radarr'
APPTITLE='radarr'
APPDEPS='libmono-cil-dev curl mediainfo'
APPDOWNLOADURL='https://api.github.com/Radarr/Radarr/releases'
APPDPORT='7878'
APPSETTINGSTYPE='DB'
APPSETTINGSDIR="/home/$UNAME/.config/Radarr"
APPSETTINGS=$APPSETTINGSDIR'/config.xml'
APPSETTINGSDB=$APPSETTINGSDIR'/nzbdrone.db'
PORTSEARCH='<port>'
DBUSERSEARCH='SELECT Username FROM Users WHERE Id = 1;'
DBPASSSEARCH='NA'
APPSYSTEMD='radarr.service'
APPSYSTEMDLOC=$SCRIPTPATH'/radarr/'$APPSYSTEMD
APPINITDLOC=$SCRIPTPATH'/radarr/radarr.init'
