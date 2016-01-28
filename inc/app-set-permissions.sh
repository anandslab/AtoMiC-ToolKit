#!/bin/bash
sudo chown -R $UNAME:$UGROUP $APPPATH >/dev/null 2>&1
sudo chmod -R 775 $APPPATH >/dev/null 2>&1
sudo chmod -R g+s $APPPATH >/dev/null 2>&1