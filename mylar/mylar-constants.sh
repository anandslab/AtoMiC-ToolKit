#!/bin/bash
APPNAME='mylar'
APPSHORTNAME='ml'
APPPATH='/opt/mylar'
APPTITLE='Mylar'
APPDEPS='python python-cherrypy'
APPPIPS='tzlocal'
APPGIT='https://github.com/evilhero/mylar.git'
APPDPORT='8090'
APPSETTINGS=$APPPATH'/mylar.ini'
ACCESSHOST='http_host = '
PORTSEARCH='http_port = '
USERSEARCH='http_username = '
PASSSEARCH='http_password = '
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='mylar.service'
APPSYSTEMDLOC=$SCRIPTPATH'/mylar/'$APPSYSTEMD
APPINITD='mylar'
APPINITDLOC=$APPPATH'/init-scripts/ubuntu.init.d'
APPDEFAULTLOC=$SCRIPTPATH'/mylar/mylar.default'
