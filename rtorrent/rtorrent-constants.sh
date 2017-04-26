#!/bin/bash
# shellcheck disable=SC2034
APPNAME='rtorrent'
APPSHORTNAME='rt'
APPPATH='/usr/bin'
APPTITLE='rTorrent'
APPDEPS='tmux'
APPSETTINGS=~/.rtorrent.rc
APPSYSTEMD='rtorrent.service'
APPSYSTEMDLOC=$SCRIPTPATH'/rtorrent/rtorrent.service'
APPINITDLOC=$SCRIPTPATH'/rtorrent/rtorrent.init'
