#!/bin/bash
APPNAME='nzbget'
APPSHORTNAME='ng'
APPPATH='/opt/nzbget'
APPTITLE='NZBGet'
APPDEPS=''
APPGIT=''
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
APPINITDLOC=$SCRIPTPATH'/nzbget/nzbget.initd'
NZBGET_CONF=$APPSETTINGS
NZBGET_BIN=$APPPATH'/nzbget'
PID_FILE=$APPPATH'/downloads/nzbget.lock'
