#!/bin/bash
#Create the update Cron Job
echo -e "${GREEN}AtoMiC Cron Job Removed Script$ENDCOLOR"
echo
echo "Are you sure you want to remove a cron job?"

source "$SCRIPTPATH/inc/pause.sh"

echo -e "$YELLOW--->Removing Update Packages and Services Cron Job...$ENDCOLOR"
CRONCMD="$SCRIPTPATH/maintenance/distro-services-update-cron.sh #AtoMiC-ToolKit"

source "$SCRIPTPATH/inc/crontab-handler.sh"
if RemoveCronTab; then
    source "$SCRIPTPATH/inc/thankyou.sh"
fi

source "$SCRIPTPATH/inc/exit.sh"
