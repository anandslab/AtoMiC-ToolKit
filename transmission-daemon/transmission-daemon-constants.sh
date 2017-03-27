#!/bin/bash
# shellcheck disable=SC2034
APPNAME='transmission-daemon'
APPSHORTNAME='trans'
APPPATH="/home/$UNAME/.config/transmission-daemon"
APPTITLE='Transmission Daemon'
APPDEPS='transmission-cli transmission-common'
APPDPORT='9091'
APPSETTINGS=$APPPATH'/settings.json'
APPREPOSITORYNAME='transmissionbt'
PORTSEARCH='"rpc-port":'
USERSEARCH='"rpc-username":'
PASSSEARCH='"rpc-password": "'
APPDEFAULTUNAME='transmission'
APPDEFAULTPASS='transmission'
APPNEWPASS=''
APPSYSTEMD='transmission-daemon.service'
APPSYSTEMDOVERIDE="$SCRIPTPATH/transmission-daemon/transmission-daemon-override.conf"
