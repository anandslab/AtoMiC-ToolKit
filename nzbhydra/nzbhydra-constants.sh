#!/bin/bash
# shellcheck disable=SC2034
APPNAME='nzbhydra'
APPSHORTNAME='nh'
APPPATH='/opt/nzbhydra'
APPTITLE='NZBHydra'
APPPIDFILE='/var/run/nzbhydra/nzbhydra.pid'
APPDEPS='python'
APPGIT='https://github.com/theotherp/nzbhydra'
APPDPORT='5075'
APPSETTINGS=$APPPATH'/nzbhydra.cfg'
ACCESSHOST='NA'
PORTSEARCH='"port":'
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='nzbhydra.service'
APPSYSTEMDLOC=$APPPATH'/contrib/'$APPSYSTEMD
APPINITD='nzbhydra'
APPINITDLOC=$APPPATH'/contrib/init.ubuntu'
APPDEFAULTLOC=$APPPATH'/contrib/defaults'
