#!/bin/bash
APPNAME='sickgear'
APPSHORTNAME='sg'
APPPATH='/home/'$UNAME'/.sickgear'
APPTITLE='SickGear'
APPDEPS='git-core python python-cheetah python-pyasn1'
APPGIT='https://github.com/SickGear/SickGear.git'
APPDPORT='8081'
APPSETTINGS=$APPPATH'/config.ini'
PORTSEARCH='web_port = '
USERSEARCH='web_username = '
PASSSEARCH='web_password = '
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPINITDLOC=$APPPATH'/init-scripts/init.ubuntu'
