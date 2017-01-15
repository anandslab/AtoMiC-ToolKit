#!/bin/bash
APPNAME='sabnzbdplus'
APPSHORTNAME='sab'
APPPATH='/home/'$UNAME'/.sabnzbd'
APPTITLE='SABnzbd'
APPDEPS=''
APPGIT=''
APPDPORT='8080'
APPSETTINGS=$APPPATH'/sabnzbd.ini'
PORTSEARCH='port = '
USERSEARCH='username = '
PASSSEARCH='password = '
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPINITDLOC=$SCRIPTPATH'/sabnzbdplus/sabnzbdplus.init'
