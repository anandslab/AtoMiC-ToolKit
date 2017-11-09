#!/bin/bash
# shellcheck disable=SC2034
APPNAME='qbittorrent-nox'
APPSHORTNAME='qbit'
APPPATH='/home/'$UNAME'/.config/qBittorrent'
APPTITLE='qBittorrent-nox'
APPDPORT='8086'
APPSETTINGS=$APPPATH'/qBittorrent.conf'
APPREPOSITORYNAME='qbittorrent-team'
REPRECVKEYSHORT='7CA69FC4'
PORTSEARCH='WebUI\\Port='
USERSEARCH='WebUI\\Username='
PASSSEARCH='WebUI\\Password_ha1='
APPDEFAULTUNAME='admin'
APPDEFAULTPASS='adminadmin'
# New password encrypted
NEWPASS="@ByteArray(0ce6d6b393ab094aacd23da311370e3a)"
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='qbittorrent-nox.service'
APPSYSTEMDLOC=$SCRIPTPATH'/qbittorrent-nox/'$APPSYSTEMD
APPINITD='qbittorrent-nox'
APPINITDLOC=$SCRIPTPATH'/qbittorrent-nox/qbittorrent-nox.init'
