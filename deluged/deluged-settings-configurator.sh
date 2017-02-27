#!/bin/bash
# Script Name: AtoMiC Deluge settings configurator
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo
echo -e $YELLOW'--->Configuring Deluge Settings...'$ENDCOLOR

#Enable torrentfiles folder & destination
sudo sed -i "s@\"copy_torrent_file\": false@\"copy_torrent_file\": true@g" $APPSETTINGS || { echo -e $RED"Modifying copy_torrent_file in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }
sudo sed -i "s@\"torrentfiles_location\": \"/home/$UNAME/Downloads\"@\"torrentfiles_location\": \"/home/$UNAME/Downloads/deluge/torrentfiles\"@g" $APPSETTINGS || { echo -e $RED"Modifying incomplete location in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }

#Enable download folder & destination
sudo sed -i "s@\"download_location\": \"/home/$UNAME/Downloads\"@\"download_location\": \"/home/$UNAME/Downloads/deluge/download\"@g" $APPSETTINGS || { echo -e $RED"Modifying incomplete location in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }

#Set completed folder destination
sudo sed -i "s@\"move_completed\": false@\"move_completed\": true@g" $APPSETTINGS || { echo -e $RED"Modifying move_completed in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }
sudo sed -i "s@\"move_completed_path\": \"/home/$UNAME/Downloads\"@\"move_completed_path\": \"/home/$UNAME/Downloads/deluge/completed\"@g" $APPSETTINGS || { echo -e $RED"Modifying completed location in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }

#Set autoadd folder enabled & destination
sudo sed -i "s@\"autoadd_enable\": false@\"autoadd_enable\": true@g" $APPSETTINGS || { echo -e $RED"Modifying autoadd_enable in $APPSETTINGS file failed."$ENDCOLOR; exit 1; } 
sudo sed -i "s@\"autoadd_location\": \"/home/$UNAME/Downloads\"@\"autoadd_location\": \"/home/$UNAME/Downloads/deluge/autoadd\"@g" $APPSETTINGS || { echo -e $RED"Modifying watch location in $APPSETTINGS file failed."$ENDCOLOR; exit 1; }

#Enable Remote Connection
sudo sed -i "s@\"allow_remote\": false@\"allow_remote\": true@g" $APPSETTINGS || { echo -e $RED"Modifying allow_remote in $APPSETTINGS file failed."$ENDCOLOR; exit 1; } 

#Set autoconnect in web.conf
sudo sed -i "s@\"default_daemon\": \"\"@\"default_daemon\": \"127.0.0.1:58846\"@g" /home/$UNAME/.config/deluge/web.conf || { echo -e $RED"Modifying default_daemon in $APPSETTINGS file failed."$ENDCOLOR; exit 1; } 
