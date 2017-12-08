#!/bin/bash
echo -e "${GREEN}--->Please read and agree to the following disclaimers:$ENDCOLOR"
echo -e '1. AtoMiC ToolKit has only been confirmed to work on Ubuntu\Debian variants, Mint, Ubuntu Server and Raspbian.'
echo -e "2. ${CYAN}www.htpcBeginner.com${ENDCOLOR}, its authors, or ToolKit contributors cannot be held accountable for any problems that might occur while using this ToolKit."
echo -e '3. If you did not run this ToolKit with sudo, you maybe asked for your root password during installation.'
echo -e '5. Best used on a clean system (with no previous app install) or after complete removal of previous app installation.'
echo -e '4. By proceeding you agree to assume all risks and authorize the ToolKit to install any required packages.'

echo

read -p 'Type y/Y and press [ENTER] to AGREE and continue with the installation or any other key to exit: '
RESP=${REPLY,,}

if [ "$RESP" != "y" ]; then
    echo
    echo -e "${RED}Because you disagreed to the disclaimers, no changes were made. If you change your mind, you may rerun ToolKit later.$ENDCOLOR"
    echo
    exit 0
else
    echo "Agreed to disclaimers: $(date)" >> "$SCRIPTPATH/tmp/consented"
fi

echo
