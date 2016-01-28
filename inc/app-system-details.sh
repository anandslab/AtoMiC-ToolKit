#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Finding '$APPTITLE' System details...'$ENDCOLOR
FQDN=$(hostname -f)
FQDN=${FQDN//[[:blank:]]/}
HNAME=$(hostname)
HNAME=${HNAME//[[:blank:]]/}
#LOCALIP = ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
LANIP=$(hostname -I)
LANIP=${LANIP//[[:blank:]]/}
WANIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
WANIP=${WANIP//[[:blank:]]/}