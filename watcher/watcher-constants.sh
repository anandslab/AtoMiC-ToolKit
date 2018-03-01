#!/bin/bash

APPNAME='watcher'
APPSHORTNAME='wt'
APPPATH='/opt/watcher3'
APPTITLE='Watcher'
APPPIPS='python-levenshtein'
APPGIT='https://github.com/nosmokingbandit/Watcher3.git'
APPDPORT='9090'
APPSETTINGS=$APPPATH'/userdata/config.cfg'
ACCESSHOST='NA'
PORTSEARCH='serverport": "'
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='watcher.service'
APPSYSTEMDLOC=$APPPATH'/run scripts/systemd.init'
APPINITD='watcher'
APPINITDLOC=$SCRIPTPATH'/watcher/watcher.init'
