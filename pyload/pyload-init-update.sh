#!/bin/bash
# Script Name: AtoMiC pyLoad init.d update
#

echo 'Updating init.d file'

sudo sed -i "s@USER=ReplaceMe@USER=$UNAME@g" "/etc/init.d/$APPINITD" || \
{ echo -e "${RED}Replacing USER failed.$ENDCOLOR" ; exit 1; }
