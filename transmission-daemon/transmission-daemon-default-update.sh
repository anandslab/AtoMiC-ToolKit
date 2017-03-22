#!/bin/bash
# Script Name: AtoMiC Transmission default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

# [optional] change to 1 to enable daemon
sudo sed -i "s@/var/lib/transmission-daemon/info@$APPPATH@g" \
            /etc/default/transmission-daemon || \
            { echo -e \
            "${RED}Replacing config directory in default failed.$ENDCOLOR" \
            ; exit 1; }
