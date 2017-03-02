#!/bin/bash
APPNAME='pyload'
APPSHORTNAME='pl'
APPPATH='/opt/pyload'
APPTITLE='pyLoad'
APPDEPS='git python python-crypto python-pycurl python-imaging tesseract-ocr zip unzip python-openssl libmozjs-24-bin'
APPGIT='https://github.com/pyload/pyload.git'
APPDPORT='8000'
APPSETTINGS="$APPSETTINGSDIR/pyload.conf"
APPSETTINGSDIR="/home/$UNAME/.pyload"
ACCESSHOST='NA'
PORTSEARCH='NA'
USERSEARCH='NA'
PASSSEARCH='NA'
APPSYSTEMD='pyload.service'
APPSYSTEMDLOC=$SCRIPTPATH'/pyload/'$APPSYSTEMD
APPINITDLOC=$SCRIPTPATH'/pyload/pyload.initd'
