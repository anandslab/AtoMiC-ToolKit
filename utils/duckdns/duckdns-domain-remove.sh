#!/bin/bash
echo
echo -e "$YELLOW--->Removing Duck DNS in ATK Sites conf...$ENDCOLOR"
CONFFILEENABLED='/etc/nginx/sites-enabled'
CONFFILEAVAILABLE='/etc/nginx/sites-available'
# Check if the sites file is present in enabled sites
for f in "$CONFFILEENABLED"/*.duckdns.org.conf; do
    [ -e "$f" ] && \
    (sudo rm "$f" >/dev/null 2>&1 && \
    echo -e "${CYAN}$f$ENDCOLOR removed from $CYAN$CONFFILEENABLED$ENDCOLOR"
    ) || \
    echo -e "No ${CYAN}.duckdns.org$ENDCOLOR domains found in $CYAN$CONFFILEENABLED$ENDCOLOR"
done
# Check if the sites file is present in available sites
for f in "$CONFFILEAVAILABLE"/*.duckdns.org.conf; do
    [ -e "$f" ] && \
    (sudo rm "$f" >/dev/null 2>&1 && \
    echo -e "${CYAN}$f$ENDCOLOR removed from $CYAN$CONFFILEAVAILABLE$ENDCOLOR"
    ) || \
    echo -e "No ${CYAN}.duckdns.org$ENDCOLOR domains found in $CYAN$CONFFILEAVAILABLE$ENDCOLOR"
done
