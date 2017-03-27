#!/bin/bash
echo -e "$YELLOW--->CHECKING TOOLKIT DEPENDENCIES ...$ENDCOLOR"
sudo apt-get -qq install apt-transport-https build-essential checkinstall curl \
dnsutils git mediainfo mediainfo-gui p7zip-full par2 sed \
software-properties-common sqlite3 tar unzip wget zip -y

echo
