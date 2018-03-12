#!/bin/bash
# Script Name: AtoMiC NZBGet Download and Install

echo
echo -e "$YELLOW--->Downloading install file...$ENDCOLOR"
wget -O - http://nzbget.net/info/nzbget-version-linux.json | \
sed -n "s/^.*stable-download.*: \"\\(.*\\)\".*/\\1/p" | \
wget --no-check-certificate -i - -O nzbget-latest-bin-linux.run
echo
echo -e "$YELLOW--->Installing $APPNAME...$ENDCOLOR"
sh nzbget-latest-bin-linux.run --destdir /opt/nzbget
rm nzbget-latest-bin-linux.run
echo
