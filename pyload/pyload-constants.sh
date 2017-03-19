#!/bin/bash
APPNAME='pyload'
APPSHORTNAME='pl'
APPPATH='/opt/pyload'
APPTITLE='pyLoad'
APPDEPS='python python-crypto python-pycurl python-imaging tesseract-ocr python-openssl libmozjs-24-bin'
APPGIT='https://github.com/pyload/pyload.git'
APPDPORT='8000'
APPSETTINGSDIR="/home/$UNAME/.pyload"
APPSETTINGS=$APPSETTINGSDIR'/pyload.conf'
ACCESSHOST='    ip host : "IP" = '
PORTSEARCH='NA'
USERSEARCH='NA'
PASSSEARCH='NA'
APPSYSTEMD='pyload.service'
APPSYSTEMDLOC=$SCRIPTPATH'/pyload/'$APPSYSTEMD
APPINITDLOC=$SCRIPTPATH'/pyload/pyload.initd'
