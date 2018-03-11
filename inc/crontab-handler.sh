#!/bin/bash

AddCronTab()
{
    if [[ -n $CRONCMD && -n $CRONJOB ]]; then
        if crontab -l | grep -q "$CRONCMD" ; then
            echo 'Cron Job already exists'
        else
            if ( crontab -l | grep -v -F "$CRONCMD" ; echo "$CRONJOB" ) | crontab - ; then
                echo "Cron Job created, To easily adjust the time/frequency, install webmin and find it under the scheduled cron jobs menu option."
            else
                echo -e "${YELLOW}Failed to create Cron Job$ENDCOLOR"
            fi
        fi
    else
        echo -e "${RED} CRONCMD and/or CRONJOB variable not set$ENDCOLOR"
    fi
}

RemoveCronTab()
{
    if [[ -n $CRONCMD ]]; then
        if crontab -l | grep -q "$CRONCMD" ; then
            if ( crontab -l | grep -v -F "$CRONCMD" ) | crontab - ; then
                echo "Cron Job removed"
            else
                echo -e "${RED}Failed to remove Cron Job$ENDCOLOR"
            fi
        else
            echo "Cron Job not found"
        fi
    else
        echo -e "${RED} CRONCMD variable not set$ENDCOLOR"
    fi
}
