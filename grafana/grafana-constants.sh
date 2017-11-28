#!/bin/bash
# shellcheck disable=SC2034
APPNAME='grafana'
APPSHORTNAME='gf'
APPPATH='/etc/grafana'
APPTITLE='Grafana'
APPDPORT='3000'
APPSETTINGS="$APPPATH/grafana.ini"
REPOPPA='NO'
REPOKEYSREQ='YES'
APPREPOSITORYNAME='grafana'
ACCESSHOST='http_addr = '
PORTSEARCH='http_port = '
USERSEARCH='NA'
APPDEFAULTUNAME='Admin'
APPDEFAULTPASS='Admin'
APPSYSTEMD='grafana-server.service'
APPINITD='grafana-server'
