#!/bin/bash
# Script Name: AtoMiC Lazy Librarian systemd update

sudo systemctl daemon-reload
sudo systemctl enable $APPSYSTEMD
