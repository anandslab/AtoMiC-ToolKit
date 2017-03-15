#!/bin/bash
echo
sleep 1
echo -e $YELLOW"--->Git stashing any local changes made to $APPTITLE..."$ENDCOLOR
git config user.name "atomic">/dev/null
git config user.email "atomic@atomic.local">/dev/null
git -C $APPPATH stash
git  -C $APPPATH stash clear
