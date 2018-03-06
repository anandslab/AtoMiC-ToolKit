#!/bin/bash
# Script Name: AtoMiC Lazy Librarian systemd update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

sudo systemctl daemon-reload
sudo systemctl enable $APPSYSTEMD
