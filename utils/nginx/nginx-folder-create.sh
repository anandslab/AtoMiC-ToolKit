#!/bin/bash
# Script Name: AtoMiC Nginx Folder Create

echo
echo -e "$YELLOW--->Creating $APPTITLE required folders...$ENDCOLOR"

while IFS= read -r folder; do
    echo -e "Creating $CYAN$folder$ENDCOLOR..."
    if [[ ! -d $folder ]]; then
        if mkdir -p "$folder"; then
            echo '...created.'
        fi
    else
        echo '...already exists.'
    fi

done < "$SCRIPTPATH/utils/$APPNAME/$APPNAME-folders-list"

find /var/www -type d -print0 | sudo xargs -0 chmod 755
find /var/www -type f -print0 | sudo xargs -0 chmod 644
sudo chown -R www-data:www-data /var/www
echo 'Set the correct folder permissions on /var/www for user www-data'
