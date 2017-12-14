#!/bin/bash
# shellcheck disable=SC2034
APPNAME='rtorrent'
APPSHORTNAME='rt'
APPTITLE='rTorrent'
APPPATH='/usr/local/share/doc/rtorrent'
APPDEPS='tmux'
APPSETTINGS="/home/$UNAME/.rtorrent.rc"
APPSYSTEMD='rtorrent.service'
APPSYSTEMDLOC=$SCRIPTPATH'/rtorrent/rtorrent.service'
APPINITD='rtorrent'
APPINITDLOC=$SCRIPTPATH'/rtorrent/rtorrent.init'
