#!/bin/bash
# Script Name: AtoMiC Lazy Librarian Installer
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

# [optional] change to 1 to enable daemon
sudo sed -i 's@ENABLE_DAEMON=0@ENABLE_DAEMON=1@g' /etc/default/$APPNAME || { echo -e $RED'Replacing ENABLE_DAEMON failed.'$ENDCOLOR ; exit 1; }

# [required] user or uid of account to run the program as:
sudo sed -i "s@RUN_AS=@RUN_AS=$UNAME@g" /etc/default/$APPNAME || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }

# [optional] change to 1 to enable updating from webinterface
# this changes ownership of /opt/lazylibrarian to user set @ RUN_AS
sudo sed -i 's@WEB_UPDATE=0@WEB_UPDATE=1@g' /etc/default/$APPNAME || { echo -e $RED'Replacing WEB_UPDATE failed.'$ENDCOLOR ; exit 1; }

# [optional] full path to the configuration file of your choice;
sudo sed -i "s@CONFIG=@CONFIG=$APPSETTINGS@g" /etc/default/$APPNAME || { echo -e $RED'Replacing CONFIG failed.'$ENDCOLOR ; exit 1; }

# [optional] full path to the folder to store data (databases/thumbs) in;
sudo sed -i "s@DATADIR=@DATADIR=$APPPATH@g" /etc/default/$APPNAME || { echo -e $RED'Replacing DATADIR failed.'$ENDCOLOR ; exit 1; }

# [optional] full path for the pidfile
sudo sed -i "s@PID_FILE=@PID_FILE=$APPPIDFILE@g" /etc/default/$APPNAME || { echo -e $RED'Replacing PID_FILE failed.'$ENDCOLOR ; exit 1; }
