#!/bin/bash
# shellcheck disable=SC2034
APPNAME='nzbget'
APPSHORTNAME='ng'
APPPATH='/opt/nzbget'
APPTITLE='NZBGet'
APPDPORT='6789'
APPSETTINGS=$APPPATH'/nzbget.conf'
ACCESSHOST='ControlIP='
PORTSEARCH='ControlPort='
USERSEARCH='ControlUsername='
PASSSEARCH='ControlPassword='
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='nzbget.service'
APPSYSTEMDLOC=$SCRIPTPATH'/nzbget/'$APPSYSTEMD
APPINITD='nzbget'
APPINITDLOC=$SCRIPTPATH'/nzbget/nzbget.initd'
NZBGET_CONF=$APPSETTINGS
NZBGET_BIN=$APPPATH'/nzbget'
PID_FILE=$APPPATH'/downloads/nzbget.lock'
