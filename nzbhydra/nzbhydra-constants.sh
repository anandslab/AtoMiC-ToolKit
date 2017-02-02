#!/bin/bash
APPNAME='nzbhydra'
APPSHORTNAME='nh'
APPPATH='/opt/nzbhydra'
APPTITLE='NZBHydra'
APPPIDFILE='/var/run/nzbhydra.pid'
APPDEPS='git python'
APPGIT='https://github.com/theotherp/nzbhydra'
APPDPORT='5075'
APPSETTINGS=$APPPATH'/nzbhydra.cfg'
ACCESSHOST='NA'
PORTSEARCH='NA'
USERSEARCH='NA'
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='nzbhydra.service'
APPSYSTEMDLOC=$APPPATH'/contrib/'$APPSYSTEMD
APPINITDLOC=$APPPATH'/contrib/init.ubuntu'
APPDEFAULTLOC=$APPPATH'/contrib/defaults'
