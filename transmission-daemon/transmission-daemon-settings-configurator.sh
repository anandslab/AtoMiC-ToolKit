#!/bin/bash
# Script Name: AtoMiC Transmission settings configurator
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $ISSETUP != "Yes" ]]; then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi

if ! grep -qF 'net.core.rmem_max' /etc/sysctl.conf;then
  echo -e $YELLOW"--->Transmission UTP and UDP Buffer Optimizations..."$ENDCOLOR
  echo 'net.core.rmem_max = 16777216' >> /etc/sysctl.conf
  echo 'net.core.wmem_max = 4194304' >> /etc/sysctl.conf
  sysctl -p
  echo
fi
