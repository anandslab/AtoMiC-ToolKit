#!/bin/bash
APPTITLE='DuckDNS'
APPNAME='duckdns'
APPPATH='/opt/duckdns'
CRONCMD="$APPPATH/duck.sh #DuckDNS"
CRONJOB="*/5 * * * * $CRONCMD"
