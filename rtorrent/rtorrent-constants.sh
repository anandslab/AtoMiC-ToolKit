#!/bin/bash

APPNAME='rtorrent'
APPSHORTNAME='rt'
APPTITLE='rTorrent'
APPPATH='/usr/share/doc/rtorrent'
APPDEPS='tmux'
APPSETTINGS="/home/$UNAME/.rtorrent.rc"
APPSYSTEMD='rtorrent.service'
APPSYSTEMDLOC=$SCRIPTPATH'/rtorrent/rtorrent.service'
APPINITD='rtorrent'
APPINITDLOC=$SCRIPTPATH'/rtorrent/rtorrent.init'
