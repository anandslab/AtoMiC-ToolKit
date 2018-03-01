#!/bin/bash

APPNAME='sickrage'
APPSHORTNAME='sr'
APPPATH='/opt/sickrage'
APPTITLE='SickRage'
APPDEPS='libsqlite3-dev libbz2-dev libreadline-dev zlib1g-dev'
APPGIT='https://github.com/sickrage/sickrage.git'
APPDPORT='8081'
APPSETTINGS=$APPPATH'/data/config.ini'
ACCESSHOST='web_host = '
PORTSEARCH='web_port = '
USERSEARCH='web_username = '
PASSSEARCH='web_password = '
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='sickrage.service'
APPSYSTEMDLOC=$APPPATH'/runscripts/init.systemd'
APPINITD='sickrage'
APPINITDLOC=$APPPATH'/runscripts/init.ubuntu'
APPDEFAULTLOC=$SCRIPTPATH'/sickrage/sickrage.default'
