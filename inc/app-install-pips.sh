#!/bin/bash
echo
sleep 1
echo -e "$YELLOW--->Installing pip prerequisites for $APPTITLE...$ENDCOLOR"
sudo -H pip install --upgrade pip
sudo -H pip install --upgrade setuptools
sudo -H pip install --upgrade $APPPIPS