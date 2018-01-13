#!/bin/bash
# shellcheck disable=SC1090

echo
sleep 1
rm "$SCRIPTPATH/tmp/$APPSHORTNAME-backup-files"
echo -e "${GREEN}--->All done. $APPTITLE restore operation ended.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-access.sh"
