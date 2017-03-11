#!/bin/bash
APPNAME='ombi'
APPSHORTNAME='ombi'
APPPATH='/opt/ombi'
APPTITLE='ombi'
APPDEPS='libmono-cil-dev curl mediainfo unzip'
APPDOWNLOADURL='https://api.github.com/ombi/ombi/releases'
APPDPORT='7878'
APPSETTINGSDIR=$APPPATH
APPSETTINGS=$APPSETTINGSDIR'/ombi.sqlite'
PORTSEARCH='<port>'
USERSEARCH='NA'
PASSSEARCH='NA'
APPSYSTEMD='ombi.service'
APPSYSTEMDLOC=$SCRIPTPATH'/ombi/'$APPSYSTEMD
APPINITDLOC=$SCRIPTPATH'/ombi/ombi.init'
