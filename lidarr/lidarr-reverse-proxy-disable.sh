#!/bin/bash
# Script Name: AtoMiC Lidarr Reverse Proxy Disable.

ReplaceString "<UrlBase>lidarr</UrlBase>" "<UrlBase></UrlBase>" "$APPSETTINGS"
