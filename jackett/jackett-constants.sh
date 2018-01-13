#!/bin/bash
# shellcheck disable=SC2034
APPNAME='jackett'
APPSHORTNAME='jk'
APPPATH='/opt/jackett'
APPTITLE='Jackett'
APPDEPS='libcurl4-openssl-dev'
APPDPORT='9117'
APPSETTINGSDIR="/home/$UNAME/.config/Jackett"
APPSETTINGS=$APPSETTINGSDIR'/ServerConfig.json'
PORTSEARCH='"Port": '
APPSYSTEMD='jackett.service'
APPSYSTEMDLOC=$SCRIPTPATH'/jackett/'$APPSYSTEMD
APPINITD='jackett'
APPINITDLOC=$SCRIPTPATH'/jackett/jackett.init'
