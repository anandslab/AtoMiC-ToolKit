#!/bin/bash
# Script Name: AtoMiC phpSysInfo settings configurator

echo
echo -e "$YELLOW--->Configuring phpSysInfo Settings...$ENDCOLOR"

# This shouldn't get hit but just in case we ever change the install we'll back up the file.
if [[ -f "$APPPATH/phpsysinfo.ini" ]]; then
    if cp "$APPPATH/phpsysinfo.ini" "$APPPATH/phpsysinfo.ini.bak" || \
            { echo -e "${RED}Failed to backup existing $APPPATH/phpsysinfo.ini$ENDCOLOR"; exit 1; }; then
        echo "Backed up $APPPATH/phpsysinfo.ini to $APPPATH/phpsysinfo.ini.bak"
    fi
fi

if sudo cp "$APPPATH/phpsysinfo.ini.new" "$APPPATH/phpsysinfo.ini" || \
        { echo -e "${RED}Failed to create new $APPPATH/phpsysinfo.ini$ENDCOLOR"; exit 1; }; then
    echo "Created new $APPPATH/phpsysinfo.ini"
fi

if sudo sed -i "s@PLUGINS=false@PLUGINS=\"PS,PSStatus,SMART\"@g" "$APPPATH/phpsysinfo.ini" || \
        { echo -e "${RED}Modifying $APPPATH/phpsysinfo.ini PLUGINS failed.$ENDCOLOR"; exit 1; }; then
    echo "Updated $APPPATH/phpsysinfo.ini to enable PLUGINS"
fi

sudo chmod 755 -R "$APPPATH"
sudo chown -R www-data:www-data "$APPPATH"
echo "Set the correct folder permissions"
