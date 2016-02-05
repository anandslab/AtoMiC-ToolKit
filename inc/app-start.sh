#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Starting '$APPTITLE$ENDCOLOR
/etc/init.d/$APPNAME start
#ADD OPTION TO CHECK IF PROCESS STARTED