#!/bin/bash
# Script Name: AtoMiC Transmission settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "$YELLOW--->Configuring Transmission Settings...$ENDCOLOR"

#Set to allow network access instead of localhost.
sudo sed -i "s@\"rpc-whitelist-enabled\": \
true@\"rpc-whitelist-enabled\": false@g" "$APPSETTINGS" \
|| { echo -e "${RED}Modifying whitelist enabled in \
$APPSETTINGS file failed.$ENDCOLOR"; exit 1; }

#Enable incomplete folder & destination
sudo sed -i "s@\"incomplete-dir-enabled\": false@\"incomplete-dir-enabled\": true@g" $APPSETTINGS  \
|| { echo -e $RED"Modifying incomplete enabled in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }
sudo sed -i "s@\"incomplete-dir\": \"/home/$UNAME/Downloads\"@\"incomplete-dir\": \"/home/$UNAME/Downloads/transmission/incomplete\"@g" $APPSETTINGS \
|| { echo -e $RED"Modifying incomplete location in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }

#Set download folder destination
sudo sed -i "s@\"download-dir\": \"/home/$UNAME/Downloads\"@\"download-dir\": \"/home/$UNAME/Downloads/transmission/completed\"@g" $APPSETTINGS \
|| { echo -e $RED"Modifying completed location in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }

#Set Watch folder enabled & destination
sudo sed -i "s@\"utp-enabled\": true@\"utp-enabled\": true,@g" $APPSETTINGS \
|| { echo -e $RED"Modifying Utp in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }
sudo sed -i '/\"utp-enabled\": true,/a \ \ \ \ \"watch-dir-enabled\": true' $APPSETTINGS \
|| { echo -e $RED"Adding Watch enabled in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }
sudo sed -i "/\"utp-enabled\": true,/a \ \ \ \ \"watch-dir\": \"/home/$UNAME/Downloads/transmission/watch\"," $APPSETTINGS \
|| { echo -e $RED"Adding watch location in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }

echo 'Done'
