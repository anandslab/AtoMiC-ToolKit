#!/bin/bash

APPNAME='couchpotato'
APPSHORTNAME='cp'
APPPATH='/opt/couchpotato'
APPTITLE='CouchPotato'
APPPIDFILE='var/run/couchpotato/couchpotato.pid'
APPDEPS='zlib1g-dev libxslt1-dev libxml2-dev'
APPGIT='https://github.com/CouchPotato/CouchPotatoServer.git'
APPDPORT='5050'
APPSETTINGS=$APPPATH'/data/settings.conf'
PORTSEARCH='port = '
USERSEARCH='username = '
PASSSEARCH='password = '
# New password unencrypted
APPNEWPASS='atomic'
# New password encrypted
NEWPASS='23d33884d600e542d097cd3933df2ae4'
APPSYSTEMD='couchpotato.service'
APPSYSTEMDLOC=$APPPATH'/init/'$APPSYSTEMD
APPINITD='couchpotato'
APPINITDLOC=$APPPATH'/init/ubuntu'
APPDEFAULTLOC=$APPPATH'/init/ubuntu.default'
