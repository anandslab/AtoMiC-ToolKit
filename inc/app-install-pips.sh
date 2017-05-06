#!/bin/bash
echo
sleep 1
echo -e "$YELLOW--->Installing pip prerequisites for $APPTITLE...$ENDCOLOR"
pip install --upgrade pip
pip install --upgrade setuptools
pip install --user $APPPIPS --upgrade
