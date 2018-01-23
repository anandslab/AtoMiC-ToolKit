#!/bin/bash
# shellcheck disable=SC2086
echo
sleep 1
echo -e "$YELLOW--->Installing pip prerequisites for $APPTITLE...$ENDCOLOR"
if [[ $1 = pip3 ]]; then
    PIP=pip3
else
    PIP=pip2
fi

sudo -H $PIP install --upgrade pip
sudo -H $PIP install --upgrade setuptools
sudo -H $PIP install --upgrade $APPPIPS
