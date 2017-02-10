#!/bin/bash
APPNAME='radarr'
APPSHORTNAME='radarr'
APPPATH='/opt/radarr'
APPTITLE='radarr'
APPDEPS='libmono-cil-dev curl mediainfo'
APPDOWNLOADURL='https://api.github.com/Radarr/Radarr/releases'
APPDPORT='7878'
APPSETTINGSDIR="/home/$UNAME/.config/Radarr"
APPSETTINGS=$APPSETTINGSDIR'/config.xml'
PORTSEARCH='<port>'
USERSEARCH='NA'
PASSSEARCH='NA'
APPSYSTEMD='radarr.service'
APPSYSTEMDLOC=$SCRIPTPATH'/radarr/'$APPSYSTEMD
APPINITDLOC=$SCRIPTPATH'/radarr/radarr.init'
