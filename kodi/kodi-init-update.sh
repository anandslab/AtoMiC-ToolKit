#!/bin/bash
# Script Name: AtoMiC Kodi init.d update

echo 'Updating init.d file'

sudo sed -i "s@RUN_AS=ReplaceMe@RUN_AS=$UNAME@g" /etc/init.d/$APPINITD || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }
