#! /usr/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Requires two arguements:\n\t'author/repo_name' \n\t'file regex'"
    exit 1
fi


curl -s "https://api.github.com/repos/$1/releases/latest" \
| grep -P "browser_download_url.*$2" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i -
