#!/bin/bash

APPNAME='nzbget'
APPSHORTNAME='ng'
APPPATH='/opt/nzbget'
APPTITLE='NZBGet'
APPDPORT='6789'
APPSETTINGS="$APPPATH/nzbget.conf"
ACCESSHOST='ControlIP='
PORTSEARCH='ControlPort='
USERSEARCH='ControlUsername='
PASSSEARCH='ControlPassword='
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPDEFAULTUNAME='nzbget'
APPDEFAULTPASS='tegbzn6789'
APPSYSTEMD='nzbget.service'
APPSYSTEMDLOC="$SCRIPTPATH/nzbget/$APPSYSTEMD"
APPINITD='nzbget'
APPINITDLOC="$SCRIPTPATH/nzbget/nzbget.initd"
NZBGET_CONF=$APPSETTINGS
NZBGET_BIN="$APPPATH/nzbget"
PID_FILE='/var/lock/nzbget.lock'
