#!/bin/bash
echo
sleep 1
echo -e $YELLOW'To access '$APPTITLE', use:'$ENDCOLOR
echo -e '--->'$CYAN'http://localhost:'$APPPORT$ENDCOLOR' on local system'
echo -e '--->'$CYAN'http://INTERNAL-IP-ADDRESS:'$APPPORT$ENDCOLOR' from local network'
echo -e '--->'$CYAN'http://domainname.tld:'$APPPORT$ENDCOLOR' or '$CYAN'http://EXTERNAL-IP-ADDRESS:'$APPPORT$ENDCOLOR' from internet'