#!/bin/bash
if grep -q "Access Details" "$SCRIPTPATH/inc/menu-$APPNAME.sh"; then
   	ACCESSSUPPORT='For access details, run the '$APPTITLE' Access Details utility.'
else
	ACCESSSUPPORT='You may now access '$APPTITLE'.'
fi
echo -e $ACCESSSUPPORT