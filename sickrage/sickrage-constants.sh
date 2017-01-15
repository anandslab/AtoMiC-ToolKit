#!/bin/bash
APPNAME='sickrage'
APPSHORTNAME='sr'
APPPATH='/home/'$UNAME'/.sickrage'
APPTITLE='SickRage'
APPDEPS='git python python-cheetah python-pyasn1'
#APPGIT='https://github.com/SiCKRAGETV/SickRage.git'
APPGIT='https://github.com/SickRage/SickRage.git'
APPDPORT='8081'
APPSETTINGS=$APPPATH'/config.ini'
PORTSEARCH='web_port = '
USERSEARCH='web_username = '
PASSSEARCH='web_password = '
# New password encrypted
NEWPASS='23d33884d600e542d097cd3933df2ae4'
# New password unencrypted
APPNEWPASS='atomic'
APPINITDLOC=$APPPATH'/init-scripts/init.ubuntu'
