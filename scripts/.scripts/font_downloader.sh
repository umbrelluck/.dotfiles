#! /bin/bash

if [[ ! -d ~/.fonts ]]; then
    mkdir ~/.fonts
fi

echo "[-] Downloading font [-]"

if [[ -z "$1" ]]; then
    URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip"
else
    URL="$1"
fi

echo "${URL}" 
wget -O Font.zip "${URL}"
unzip Font.zip -d ~/.fonts
rm Font.zip
fc-cache -fv
echo "done!"
