#!/bin/bash
# shellcheck disable=SC2034
if IsSystemdSupported; then
    sudo systemctl stop apache2.service
    sudo systemctl disable apache2
else
    sudo service apach2 stop
    sudo update-rc.d apache2 disable
fi
