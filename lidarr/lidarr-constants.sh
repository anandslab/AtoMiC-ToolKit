#!/bin/bash

APPNAME='lidarr'
APPSHORTNAME='lr'
APPPATH='/opt/lidarr'
APPTITLE='Lidarr'
APPDEPS='libmono-cil-dev'
APPDOWNLOADURL='https://api.github.com/repos/lidarr/lidarr/releases'
APPDOWNLOADEXT='linux.tar.gz'
APPDOWNLOADSTRIP='--strip-components=1'
APPDPORT='8686'
APPSETTINGSTYPE='DB'
APPSETTINGSDIR="/home/$UNAME/.config/Lidarr"
APPSETTINGS=$APPSETTINGSDIR'/config.xml'
APPSETTINGSDB=$APPSETTINGSDIR'/lidarr.db'
PORTSEARCH='<port>'
DBUSERSEARCH='SELECT Username FROM Users WHERE Id = 1;'
APPSYSTEMD='lidarr.service'
APPSYSTEMDLOC=$SCRIPTPATH'/lidarr/'$APPSYSTEMD
APPINITD='lidarr'
APPINITDLOC=$SCRIPTPATH'/lidarr/lidarr.init'
