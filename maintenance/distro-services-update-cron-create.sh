#!/bin/bash
#Create the update Cron Job
echo -e "${GREEN}AtoMiC Cron Job Installer Script$ENDCOLOR"
echo
echo "Are you sure you want to create a cron job to run every night at 12am to update all packages and installed services?"

source "$SCRIPTPATH/inc/pause.sh"

echo -e "$YELLOW--->Creating Update Packages and Services Cron Job...$ENDCOLOR"
CRONCMD="$SCRIPTPATH/maintenance/distro-services-update-cron.sh #AtoMiC-ToolKit"
CRONJOB="0 0 * * * $CRONCMD"

source "$SCRIPTPATH/inc/crontab-handler.sh"
if AddCronTab; then
    source "$SCRIPTPATH/inc/thankyou.sh"
fi

source "$SCRIPTPATH/inc/exit.sh"
