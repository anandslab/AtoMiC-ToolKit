#!/bin/bash
# Script Name: AtoMiC NZBGet Initd Update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

sudo sed -i "s@NZBGET_USER=nzb@NZBGET_USER=$UNAME@g" /etc/init.d/$APPNAME || { echo -e $RED'Replacing NAME failed.'$ENDCOLOR ; exit 1; }
sudo sed -i "s@NZBGET_GROUP=nzb@NZBGET_GROUP=$UGROUP@g" /etc/init.d/$APPNAME || { echo -e $RED'Replacing GROUP failed.'$ENDCOLOR ; exit 1; }
sudo sed -i "s@NZBGET_CONF=/etc/nzbget.conf@NZBGET_CONF=$APPSETTINGS@g" /etc/init.d/$APPNAME || { echo -e $RED'Replacing NZBGET_CONF path failed.'$ENDCOLOR ; exit 1; }
sudo sed -i "s@NZBGET_BIN=/usr/local/bin/nzbget@NZBGET_BIN=$NZBGET_BIN@g" /etc/init.d/$APPNAME || { echo -e $RED'Replacing NZBGET_BIN failed.'$ENDCOLOR ; exit 1; }
sudo sed -i "s@PID_FILE=/home/user/downloads/nzbget.lock@PID_FILE=$PID_FILE@g" /etc/init.d/$APPNAME || { echo -e $RED'Replacing PID_FILE failed.'$ENDCOLOR ; exit 1; }
sudo update-rc.d $APPNAME defaults