#!/bin/bash
# Script Name: AtoMiC Nginx Locations Configurator

echo
echo -e "${YELLOW}--->configuring Nginx Locations $ENDCOLOR"

# Copy any missing location files over but doesnt enable them. Enabled as required by each service)
for f in "$SCRIPTPATH"/utils/nginx/locations-available/*.conf; do
    filename=$(basename $f)
    if [[ ! -f /etc/nginx/locations-available/$filename ]]; then
        if cp $f "/etc/nginx/locations-available/$filename" || \
            { echo -e "${RED}Could not move location file $filename over.$ENDCOLOR"; exit 1; }; then
            echo "Location file $filename copied over"
            LOCCHANGEREQ=1
        fi
    else
        # Does the file need updating with a new version
        NEWFILEVER=$(grep Version $f | cut -d= -f2)
        EXISTINGFILEVER=$(grep Version /etc/nginx/locations-available/$filename | cut -d= -f2)
        vercomp "$NEWFILEVER" "$EXISTINGFILEVER"
        if [[ $? = 2 ]]; then
            if cp $f "/etc/nginx/locations-available/$filename" || \
                { echo -e "${RED}Could not move location file $filename over.$ENDCOLOR"; exit 1; }; then
                echo "Location file $filename copied over"
                LOCCHANGEREQ=1
            fi
        fi
        # Reset the variables to be safe.
        NEWFILEVER=''
        EXISTINGFILEVER=''
    fi
done

if [[ -z $LOCCHANGEREQ ]]; then
    echo 'No changes required'
    LOCCHANGEREQ=''
fi
