#!/bin/bash

APPNAME='jackett'
APPSHORTNAME='jk'
APPPATH='/opt/jackett'
APPTITLE='Jackett'
APPDEPS='libcurl4-openssl-dev'
APPDOWNLOADURL='https://api.github.com/repos/jackett/jackett/releases/latest'
APPDOWNLOADEXT='Mono.tar.gz'
APPDOWNLOADSTRIP='--strip-components=1'
APPDPORT='9117'
APPSETTINGSDIR="/home/$UNAME/.config/Jackett"
APPSETTINGS=$APPSETTINGSDIR'/ServerConfig.json'
PORTSEARCH='"Port": '
APPSYSTEMD='jackett.service'
APPSYSTEMDLOC=$SCRIPTPATH'/jackett/'$APPSYSTEMD
APPINITD='jackett'
APPINITDLOC=$SCRIPTPATH'/jackett/jackett.init'
