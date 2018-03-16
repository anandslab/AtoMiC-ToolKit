#!/bin/bash
# Script Name: AtoMiC Ombi init.d update

echo 'Updating init.d file'
if sudo sed -i "s@user=\"ReplaceMe\"@user=\"$UNAME\"@g" "/etc/init.d/$APPINITD" || \
        { echo -e "${RED}Replacing user failed.$ENDCOLOR" ; exit 1; }; then
    echo "Set USER to $UNAME"
fi

if sudo sed -i "s@group=\"ReplaceMe\"@group=\"$UGROUP\"@g" "/etc/init.d/$APPINITD" || \
        { echo -e "${RED}Replacing group failed.$ENDCOLOR" ; exit 1; }; then
    echo "Set GROUP to $UGROUP"
fi
