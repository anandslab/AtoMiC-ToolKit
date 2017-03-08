#!/bin/bash
APPNAME='watcher'
APPSHORTNAME='wt'
APPPATH='/opt/watcher'
APPTITLE='Watcher'
APPDEPS='git python'
APPGIT='https://github.com/nosmokingbandit/watcher.git'
APPDPORT='9090'
APPSETTINGS=$APPPATH'/config.cfg'
ACCESSHOST='NA'
PORTSEARCH='serverport": "'
USERSEARCH='NA'
PASSSEARCH='NA'
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='watcher.service'
APPSYSTEMDLOC=$APPPATH'/run scripts/systemd.init'
