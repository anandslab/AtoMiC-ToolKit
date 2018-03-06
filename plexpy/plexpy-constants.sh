#!/bin/bash

APPNAME='plexpy'
APPSHORTNAME='pp'
APPPATH='/opt/plexpy'
APPTITLE='PlexPy'
APPGIT='https://github.com/JonnyWong16/plexpy.git'
APPDPORT='8182'
APPSETTINGSTYPE='DB'
APPSETTINGS=$APPPATH'/config.ini'
APPSETTINGSDB=$APPPATH'/plexpy.db'
ACCESSHOST='http_host = '
PORTSEARCH='http_port = '
DBUSERSEARCH='SELECT username FROM users WHERE id = 2;'
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='plexpy.service'
APPSYSTEMDLOC=$APPPATH'/init-scripts/init.systemd'
APPINITD='plexpy'
APPINITDLOC=$APPPATH'/init-scripts/init.ubuntu'
APPDEFAULTLOC=$SCRIPTPATH'/plexpy/plexpy.default'
NGINXCONFNAME='plexpy'
