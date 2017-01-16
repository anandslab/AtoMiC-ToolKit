#!/bin/bash
APPNAME='qbittorrent-nox'
APPSHORTNAME='qbit'
APPPATH='/home/'$UNAME'/.config/qBittorrent'
APPTITLE='qBittorrent'
APPDEPS=''
APPGIT=''
APPDPORT='8086'
APPSETTINGS=$APPPATH'/qBittorrent.conf'
PORTSEARCH='WebUI\\Port='
USERSEARCH='WebUI\\Username='
PASSSEARCH='WebUI\\Password_ha1='
APPDEFAULTUNAME='admin'
APPDEFAULTPASS='adminadmin'
# New password encrypted
NEWPASS="@ByteArray(0ce6d6b393ab094aacd23da311370e3a)"
# New password unencrypted
APPNEWPASS='atomic'
APPINITDLOC=$SCRIPTPATH'/qbittorrent-nox/qbittorrent-init'
