#!/bin/bash
APPNAME='couchpotato'
APPSHORTNAME='cp'
APPPATH='/home/'$UNAME'/.couchpotato'
APPTITLE='CouchPotato'
APPDEPS='git-core python python-cheetah python-pyasn1'
APPGIT='https://github.com/RuudBurger/CouchPotatoServer.git'
APPDPORT='5050'
APPSETTINGS=$APPPATH'/settings.conf'
PORTSEARCH='port = '
USERSEARCH='username = '
PASSSEARCH='password = '
# New password unencrypted
APPNEWPASS='atomic'
# New password encrypted
NEWPASS='23d33884d600e542d097cd3933df2ae4'
APPINITDLOC=$APPPATH'/init/ubuntu'
