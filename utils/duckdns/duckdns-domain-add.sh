#!/bin/bash
echo
echo -e "$YELLOW--->Enablinging Duck DNS in ATK Sites conf...$ENDCOLOR"
ATKCONFFILE='/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites'
# Check if the sites file is present
if [[ -f $ATKCONFFILE ]]; then
   for i in ${DOMAINNAME//,/ }; do
    # Loop each have the duckdns domain and add it
        if grep -q "$i.duckdns.org" "$ATKCONFFILE"; then
            echo -e "$CYAN$i.duckdns.org$ENDCOLOR already in $CYAN$ATKCONFFILE$ENDCOLOR"
        else
            # No so insert it in
            if sed -i "s@server_name @server_name  $i.duckdns.org@" "$ATKCONFFILE"; then
                echo -e "$CYAN$i.duckdns.org$ENDCOLOR inserted into $CYAN$ATKCONFFILE$ENDCOLOR"
            fi
        fi
    done
else
    echo -e "${RED}/etc/nginx/sites-available/AtoMiC-ToolKit-configured-sites not found. \
Please install NGINX or you will need to configure your webserer software manually.$ENDCOLOR"
fi
echo
