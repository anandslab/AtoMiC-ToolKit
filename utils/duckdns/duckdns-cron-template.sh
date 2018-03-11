#!/bin/bash
logger "Started Duck DNS Update"

echo url="https://www.duckdns.org/update?domains=DOMAINNAME&token=TOKENID&ip=" | curl -k -o /opt/duckdns/duck.log -K -

logger "Finished Duck DNS Update"
