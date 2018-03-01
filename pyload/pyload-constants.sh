#!/bin/bash

APPNAME='pyload'
APPSHORTNAME='pl'
APPPATH='/opt/pyload'
APPTITLE='pyLoad'
APPDEPS="tesseract-ocr libmozjs-24-bin"
APPPIPS='pycurl'
APPGIT='-b stable https://github.com/pyload/pyload.git'
APPDPORT='8000'
APPSETTINGSDIR="/home/$UNAME/.pyload"
APPSETTINGS=$APPSETTINGSDIR'/pyload.conf'
ACCESSHOST='    ip host : "IP" = '
APPSYSTEMD='pyload.service'
APPSYSTEMDLOC=$SCRIPTPATH'/pyload/'$APPSYSTEMD
APPINITD='pyload'
APPINITDLOC=$SCRIPTPATH'/pyload/pyload.initd'
PROXYREQSUFFIX='NO'
