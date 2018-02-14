#!/bin/bash
# Script Name: AtoMiC Lazy Librarian default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com

echo -e "${YELLOW}--->Updating Default file...$ENDCOLOR"

# [required] user or uid of account to run the program as:
sudo sed -i "s@RUN_AS=\$USER@RUN_AS=$UNAME@g" /etc/default/$APPNAME || { echo -e "${RED}Replacing RUN_AS failed.$ENDCOLOR" ; exit 1; }

# [required] set path where lazylibrarian is installed:
sudo sed -i "s@APP_PATH=/opt/LazyLibrarian@APP_PATH=$APPPATH@g" /etc/default/$APPNAME || { echo -e "${RED}Replacing APP_PATH failed.$ENDCOLOR" ; exit 1; }

# [optional] full path to the configuration file of your choice;
sudo sed -i "s@CONFIG=@CONFIG=$APPSETTINGS@g" /etc/default/$APPNAME || { echo -e "${RED}Replacing CONFIG failed.$ENDCOLOR" ; exit 1; }

# [optional] full path to the folder to store data (databases/thumbs) in;
sudo sed -i "s@DATADIR=@DATADIR=$APPPATH/data@g" /etc/default/$APPNAME || { echo -e "${RED}Replacing DATADIR failed.$ENDCOLOR" ; exit 1; }

echo 'Updated Default file with new values'
