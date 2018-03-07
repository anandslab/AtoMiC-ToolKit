#!/bin/bash

echo
echo -e "$YELLOW--->Stopping running PIA Manager processes...$ENDCOLOR"
if [[ -n $(pgrep -f pia_manager) ]]; then
    if pkill -f pia_manager; then
        echo "kill successful"
    else
        echo "kill unsuccessful"
    fi
else
    echo "Nothing found to stop"
fi
