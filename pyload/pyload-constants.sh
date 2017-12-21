#!/bin/bash
# shellcheck disable=SC2034
APPNAME='pyload'
APPSHORTNAME='pl'
APPPATH='/opt/pyload'
APPTITLE='pyLoad'
APPDEPS="python python-crypto python-pycurl python-imaging \
tesseract-ocr python-openssl libmozjs-24-bin"
APPGIT='-b stable https://github.com/pyload/pyload.git'
APPDPORT='8000'
APPSETTINGSDIR="/home/$UNAME/.pyload"
APPSETTINGS=$APPSETTINGSDIR'/pyload.conf'
ACCESSHOST='    ip host : "IP" = '
APPSYSTEMD='pyload.service'
APPSYSTEMDLOC=$SCRIPTPATH'/pyload/'$APPSYSTEMD
APPINITD='pyload'
APPINITDLOC=$SCRIPTPATH'/pyload/pyload.initd'
