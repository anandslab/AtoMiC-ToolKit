#!/bin/bash

APPNAME='tautulli'
APPSHORTNAME='tt'
APPPATH='/opt/Tautulli'
APPTITLE='Tautulli'
APPGIT='https://github.com/Tautulli/Tautulli.git'
APPDPORT='8182'
APPSETTINGSTYPE='DB'
APPSETTINGS=$APPPATH'/config.ini'
APPSETTINGSDB=$APPPATH'/tautulli.db'
ACCESSHOST='http_host = '
PORTSEARCH='http_port = '
DBUSERSEARCH='SELECT username FROM users WHERE id = 2;'
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='tautulli.service'
APPSYSTEMDLOC=$APPPATH'/init-scripts/init.systemd'
APPINITD='tautulli'
APPINITDLOC=$APPPATH'/init-scripts/init.ubuntu'
APPDEFAULTLOC=$SCRIPTPATH'/tautulli/tautulli.default'
NGINXCONFNAME='tautulli'
