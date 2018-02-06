#!/bin/bash
echo
sleep 1
echo -e "${YELLOW}--->Finding $APPTITLE System details...$ENDCOLOR"
FQDN=$(hostname -f)
FQDN=${FQDN//[[:blank:]]/}
HNAME=$(hostname)
HNAME=${HNAME//[[:blank:]]/}
set -- $(hostname -I)
LANIP=$1
LANIP=${LANIP//[[:blank:]]/}
WANIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
WANIP=${WANIP//[[:blank:]]/}
set -- 
