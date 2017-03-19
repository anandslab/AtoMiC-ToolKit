#!/bin/bash
# Script Name: AtoMiC Integration Test Application Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
mkdir "./tmp"

echo "Agreed to disclaimers: `date '+%m-%d-%Y_%H-%M'`" >> "./tmp/consented"
echo "UNAME=root" >> "./tmp/userinfo"
echo "UGROUP=root" >> "./tmp/userinfo"

sudo bash setup.sh -i webmin
