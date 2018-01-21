#!/bin/bash
# shellcheck disable=SC2034
APPNAME='glances'
APPPATH='/usr/local/share/doc/glances'
APPTITLE='Glances'
APPPIPS='glances[action,browser,cloud,cpuinfo,chart,docker,export,folders,gpu,ip,raid,snmp,web,wifi]'
APPDPORT='61208'
APPSETTINGS='/usr/local/share/doc/glances/glances.conf'
APPSYSTEMD='glances.service'
APPSYSTEMDLOC="$SCRIPTPATH/$APPNAME/$APPSYSTEMD"
APPINITD='glances'
APPINITDLOC="$SCRIPTPATH/$APPNAME/$APPINITD.init"
