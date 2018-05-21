#!/bin/bash
# Script Name: AtoMiC NPM NO SUDO Installer

echo
echo -e "${YELLOW}--->Setting Up NPM to work without SUDO...$ENDCOLOR"
wget -O- https://raw.githubusercontent.com/glenpike/npm-g_nosudo/master/npm-g-nosudo.sh | sudo -u "$UNAME" sh

if [[ -f /home/$UNAME/.bashrc ]]; then
    if ! grep -q "/home/$UNAME/.npm-packages" "/home/$UNAME/.bashrc"; then
        cat "$SCRIPTPATH/utils/nodejs/npm-fix" >> "/home/$UNAME/.bashrc"
        ReplaceString ReplaceMe "/home/$UNAME/.npm-packages" "/home/$UNAME/.bashrc"
        echo "Configured /home/$UNAME/.bashrc"
    else
        echo "/home/$UNAME/.bashrc already configured"
    fi
    source "/home/$UNAME/.bashrc"
fi

if [[ -f /home/$UNAME/.zshrc ]]; then
    if ! grep -q "/home/$UNAME/.npm-packages" "/home/$UNAME/.zshrc"; then
        cat "$SCRIPTPATH/utils/nodejs/npm-fix" >> "/home/$UNAME/.zshrc"
        ReplaceString ReplaceMe "/home/$UNAME/.npm-packages" "/home/$UNAME/.zshrc"
        echo "Configured /home/$UNAME/.zshrc"
    else
        echo "/home/$UNAME/.zshrc already configured"
    fi
    source "/home/$UNAME/.zshrc"
fi
