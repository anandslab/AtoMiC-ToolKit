#!/bin/bash
# Script Name: AtoMiC Watcher init.d update

echo 'Updating init.d file'

sudo sed -i "s@DAEMON_USER=ReplaceMe@DAEMON_USER=$UNAME@g" /etc/init.d/$APPINITD || { echo -e $RED'Replacing DAEMON_USER failed.'$ENDCOLOR ; exit 1; }
