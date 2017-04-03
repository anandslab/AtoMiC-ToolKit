#!/bin/bash
# shellcheck disable=SC1090

if [ ! -d "$APPPATH" ]; then
    echo -e "${RED}Error! $CYAN$APPPATH$RED not found. "\
            "$ENDCOLOR$APPTITLE not installed or incompatible installation."
    exit 1
fi
