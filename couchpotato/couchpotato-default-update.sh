#!/bin/bash
# Script Name: AtoMiC CouchPotato default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com


echo -e "${YELLOW}--->Updating Default file...$ENDCOLOR"

# username to run couchpotato under
sudo sed -i "s@CP_USER=couchpotato@CP_USER=$UNAME@g" "/etc/default/$APPNAME" || { echo -e "${RED}Replacing CP_USER failed.$ENDCOLOR" ; exit 1; }

# directory of CouchPotato.py
sudo sed -i "s@CP_HOME=@CP_HOME=$APPPATH@g" "/etc/default/$APPNAME" || { echo -e "${RED}Replacing CP_HOME failed.$ENDCOLOR" ; exit 1; }

# directory of couchpotato's db, cache and logs
sudo sed -i "s@CP_DATA=@CP_DATA=$APPPATH/data@g" "/etc/default/$APPNAME" || { echo -e "${RED}Replacing CP_DATA failed.$ENDCOLOR" ; exit 1; }

# full path of couchpotato.pid
sudo sed -i "s@CP_PIDFILE=@CP_PIDFILE=$APPPIDFILE@g" "/etc/default/$APPNAME" || { echo -e "${RED}Replacing CP_PIDFILE failed.$ENDCOLOR" ; exit 1; }

# full path of the python binary
sudo sed -i "s@PYTHON_BIN=@PYTHON_BIN=/usr/bin/python@g" "/etc/default/$APPNAME" || { echo -e "${RED}Replacing PYTHON_BIN failed.$ENDCOLOR" ; exit 1; }

echo 'Updated Default file with new values'
