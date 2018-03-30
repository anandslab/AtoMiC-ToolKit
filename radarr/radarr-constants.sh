#!/bin/bash

APPNAME='radarr'
APPSHORTNAME='radarr'
APPPATH='/opt/radarr'
APPTITLE='radarr'
APPDEPS='libmono-cil-dev'
APPDOWNLOADURL='https://api.github.com/repos/radarr/radarr/releases'
APPDOWNLOADEXT='linux.tar.gz'
APPDOWNLOADSTRIP='--strip-components=1'
APPDPORT='7878'
APPSETTINGSTYPE='DB'
APPSETTINGSDIR="/home/$UNAME/.config/Radarr"
APPSETTINGS=$APPSETTINGSDIR'/config.xml'
APPSETTINGSDB=$APPSETTINGSDIR'/nzbdrone.db'
PORTSEARCH='<port>'
DBUSERSEARCH='SELECT Username FROM Users WHERE Id = 1;'
APPSYSTEMD='radarr.service'
APPSYSTEMDLOC=$SCRIPTPATH'/radarr/'$APPSYSTEMD
APPINITD='radarr'
APPINITDLOC=$SCRIPTPATH'/radarr/radarr.init'
