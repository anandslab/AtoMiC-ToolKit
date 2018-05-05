#!/bin/bash
# Script Name: AtoMiC Nginx Snippets Configurator

echo
echo -e "${YELLOW}--->configuring Nginx Snippets $ENDCOLOR"

# Copy any missing snippet files over but doesnt enable them.
for f in "$SCRIPTPATH"/utils/nginx/snippets/*.conf; do
    filename=$(basename $f)
    if [[ ! -f /etc/nginx/snippets/$filename ]]; then
        if cp $f "/etc/nginx/snippets/$filename" || \
            { echo -e "${RED}Could not move snippet file $filename over.$ENDCOLOR"; exit 1; }; then
            echo "Snippet file $filename copied over"
            SNIPCHANGEREQ=1
        fi
    fi
done

# Set the correct FPMVERSION in php.atomic.conf.
if [[ -f "/etc/nginx/snippets/php.atomic.conf" ]]; then
    if ! grep -q "fastcgi_pass unix:/var/run/php/$FPMVERSION.sock;" /etc/nginx/snippets/php.atomic.conf; then
        ReplaceString "fastcgi_pass [^;]*;" "fastcgi_pass unix:/var/run/php/$FPMVERSION.sock;" "/etc/nginx/snippets/php.atomic.conf"
        SNIPCHANGEREQ=1
    fi
fi

if [[ -z $SNIPCHANGEREQ ]]; then
    echo 'No changes required'
    SNIPCHANGEREQ=''
fi
