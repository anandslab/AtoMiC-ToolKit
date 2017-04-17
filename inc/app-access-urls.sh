#!/bin/bash
echo
sleep 1
echo -e "${YELLOW}You may be able to access $APPTITLE" \
        " on any of the following URLs...$ENDCOLOR"

if [[ $APPUSESNGINX = 'YES' ]]; then
    HTTP=''
    DIVIDE='/'
else
    HTTP="http://"
    DIVIDE=':'
fi

if [[ ! -z $WANIP ]]; then
    echo -e "--->$CYAN$HTTP$WANIP$DIVIDE$APPDPORT$ENDCOLOR" \
            "from anywhere (requires port forwarding on router)"
fi

if [[ ! -z $LANIP ]]; then
    echo -e "--->$CYAN$HTTP$LANIP$DIVIDE$APPDPORT$ENDCOLOR" \
            "from your local network"
fi

if [[ ! -z $HNAME ]] || [[ $APPUSESNGINX = 'YES' ]]; then
    echo -e "--->$CYAN$HTTP$HNAME$DIVIDE$APPDPORT$ENDCOLOR" \
            "from your local network"
fi

if [[ $APPUSESNGINX = 'YES' ]]; then
    echo -e "--->${CYAN}0.0.0.0/$APPDPORT$ENDCOLOR on this system"
else
    echo -e "--->$CYAN${HTTP}localhost:$APPDPORT$ENDCOLOR" \
        "on this system"
fi

if ! [[ $APPSETTINGS = 'NA' ]]; then
    echo -e "Actual port numbers could be different. " \
            "Check your settings file: $APPSETTINGS"
fi

echo -e "If SSL is enabled," \
        "then use HTTPS instead of HTTP in the above URLs."
