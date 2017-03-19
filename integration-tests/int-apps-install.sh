#!/bin/bash
# Script Name: AtoMiC Integration Test Application Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
export CALLER=$(ps ax | grep "^ *$PPID" | awk '{print $NF}')
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
export SCRIPTPATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo "Agreed to disclaimers: `date '+%m-%d-%Y_%H-%M'`" >> "$SCRIPTPATH/tmp/consented"
echo "UNAME=root" >> "$SCRIPTPATH/tmp/userinfo"
echo "UGROUP=root" >> "$SCRIPTPATH/tmp/userinfo"
sudo bash setup.sh -i webmin
