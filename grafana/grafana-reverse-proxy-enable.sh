#!/bin/bash
# Script Name: AtoMiC Grafana Reverse Proxy Enable.

if sed -i "/root_url/c\\root_url = %(protocol)s:\\/\\/%(domain)s:%(http_port)s\\/grafana" "$APPSETTINGS"; then
    echo "Updated root_url in $APPSETTINGS"
fi
