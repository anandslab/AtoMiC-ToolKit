#!/bin/bash

echo "Updating Distro & Apps"

source $SCRIPTPATH/inc/pkgupdate.sh
sudo apt-get -y dist-upgrade
sudo apt-get -y autoclean
