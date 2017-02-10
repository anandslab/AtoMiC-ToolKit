#!/bin/bash
curl -s $APPGIT/releases | grep browser_download_url | head -n 1 | cut -d '"' -f 4