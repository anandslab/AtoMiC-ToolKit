#!/bin/bash
echo
echo -e "$YELLOW--->Removing Duck DNS in ATK Sites conf...$ENDCOLOR"
ATKCONFFILE='/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites'
# Check if the sites file is present
if [[ -f $ATKCONFFILE ]]; then
    # If it is does it have the duckdns domain in it?
    if grep -q "duckdns.org" "$ATKCONFFILE"; then
     # Yes so remove it, get the linenum of server_name
        linenum=$(awk '/server_name/{ print NR; exit }' "$ATKCONFFILE")
        if sed -i "$linenum"'s/\w*\.duckdns\.org//g' "$ATKCONFFILE"; then
            echo -e "${CYAN}duckdns.org domain(s)$ENDCOLOR removed from $CYAN$ATKCONFFILE$ENDCOLOR"
        fi
    else
        echo -e "No ${CYAN}.duckdns.org$ENDCOLOR domains found in $CYAN$ATKCONFFILE$ENDCOLOR"
    fi
fi
