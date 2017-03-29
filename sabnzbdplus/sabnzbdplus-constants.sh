#!/bin/bash
# shellcheck disable=SC2034
APPNAME='sabnzbdplus'
APPSHORTNAME='sab'
APPPATH='/usr/share/sabnzbdplus'
APPTITLE='SABnzbd+'
APPDEPS='python-pip python-dev python-cryptography'
APPPIPS='sabyenc'
APPDPORT='8080'
APPSETTINGS=$APPPATH'/sabnzbdplus.ini'
APPREPOSITORYNAME='jcfp'
REPKEYSERVER='hkp://pool.sks-keyservers.net:11371'
REPRECVKEYS='0x98703123E0F52B2BE16D586EF13930B14BB9F05F'
REPRECVKEYSHORT='4BB9F05F'
ACCESSHOST='host = '
PORTSEARCH='port = '
USERSEARCH='username = '
PASSSEARCH='password = '
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='sabnzbdplus.service'
APPSYSTEMDLOC=$SCRIPTPATH'/sabnzbdplus/'$APPSYSTEMD
APPINITDLOC=$SCRIPTPATH'/sabnzbdplus/sabnzbdplus.init'
APPDEFAULTLOC=$SCRIPTPATH'/sabnzbdplus/sabnzbdplus.default'
