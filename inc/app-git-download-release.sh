#!/bin/bash
# Script Name: AtoMiC Github Release Installer

echo
echo -e "$YELLOW--->Latest File Found...$ENDCOLOR"

OUTPUT="$(curl -s "$APPDOWNLOADURL" | \
grep "$APPDOWNLOADEXT" | \
grep browser_download_url | \
head -n 1 | \
cut -d '"' -f 4)"

#Sometimes it struggles for some reason so try again!
if [[ -z $OUTPUT ]]; then
    echo -e "${RED}URL NOT FOUND AT FIRST ATTEMPT.. RETRYING$ENDCOLOR"
    OUTPUT="$(curl -s "$APPDOWNLOADURL" | \
    grep "$APPDOWNLOADEXT" | \
    grep browser_download_url | \
    head -n 1 | \
    cut -d '"' -f 4)"
fi

if [[ -z $OUTPUT ]]; then
    echo -e "${RED}URL NOT FOUND$ENDCOLOR"
    exit 1
fi

EXTENSION="${OUTPUT##*.}"
case $EXTENSION in
  "bz2" ) EXTRACTTYPE='xjf';;
  "gz")   EXTRACTTYPE="xzf";;
esac

echo "$OUTPUT"
echo
echo -e "$YELLOW--->Downloading and extracting files...$ENDCOLOR"
curl -L "$OUTPUT" | sudo tar -$EXTRACTTYPE - -C "$APPPATH" "$APPDOWNLOADSTRIP"
