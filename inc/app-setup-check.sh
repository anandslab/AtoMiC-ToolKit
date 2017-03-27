#!/bin/bash
if [[ ! $ISSETUP = "Yes" ]]; then
    echo
    echo -e "\e[91mCannot be run directly. Please run setup.sh from " \
            "AtoMiC ToolKit root folder: \033[0msudo bash setup.sh"
    echo
    exit 1
fi
