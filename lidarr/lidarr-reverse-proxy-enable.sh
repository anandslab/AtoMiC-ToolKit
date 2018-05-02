#!/bin/bash
# Script Name: AtoMiC Lidarr Reverse Proxy Enable.

ReplaceString "<UrlBase></UrlBase>" "<UrlBase>lidarr</UrlBase>" "$APPSETTINGS"
