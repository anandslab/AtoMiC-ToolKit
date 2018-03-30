#!/bin/bash
# Script Name: AtoMiC Get Latest Github Release Version

AVAILABLEVERSION="$(curl -s "$APPDOWNLOADURL" | \
grep tag_name | \
cut -d '"' -f 4 | \
head -n 1 | \
sed s'/[v"]//g')"

