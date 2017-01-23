#!/bin/bash
APPNAME='sabnzbdplus'
APPSHORTNAME='sab'
APPPATH='/usr/share/sabnzbdplus'
APPTITLE='SABnzbd'
APPDEPS=''
APPGIT=''
APPDPORT='8080'
APPSETTINGS=$APPPATH'/sabnzbdplus.ini'
APPREPOSITORYLINK='ppa:jcfp/ppa'
APPREPOSITORYNAME='jcfp'
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
