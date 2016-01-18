#!/bin/bash
# Script Name: AtoMiC MakeMKV Installer
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $1 != *"setup.sh"* ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi

source $2/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN'AtoMiC MakeMKV Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install \
    build-essential \
    pkg-config \
    libc6-dev \
    libssl-dev \
    libexpat1-dev \
    libavcodec-dev \
    libgl1-mesa-dev \
    libqt4-dev

echo
sleep 1

echo -e $YELLOW'--->Downloading latest MakeMKV...'$ENDCOLOR
sudo mkdir -p /tmp/makemkv
cd /tmp/makemkv
sudo wget http://www.makemkv.com/download/makemkv-oss-$APPVERSION.tar.gz
sudo tar -xf makemkv-oss-$APPVERSION.tar.gz
sudo wget http://www.makemkv.com/download/makemkv-bin-$APPVERSION.tar.gz
sudo tar -xf makemkv-bin-$APPVERSION.tar.gz

echo
sleep 1

echo -e $YELLOW'--->Configuring MakeMKV Install...'$ENDCOLOR
cd /tmp/makemkv/makemkv-oss-$APPVERSION
./configure
make
sudo make install

cd /tmp/makemkv/makemkv-bin-$APPVERSION
clear
echo -e $YELLOW'When the MakeMKV License appears, type "q". Afterwards, type "yes" to agree and press [Enter]'$ENDCOLOR
echo
source $SCRIPTPATH/inc/pause.sh
make
sudo make install

echo
sleep 1

echo -e $YELLOW'--->Removing temporary MakeMKV Files...'$ENDCOLOR
sudo rm -rf /tmp/makemkv

echo
sleep 1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'makemkvcon should be located here '$CYAN'/usr/bin/makemkvcon'$ENDCOLOR

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh