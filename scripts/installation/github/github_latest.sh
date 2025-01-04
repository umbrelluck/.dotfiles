#! /usr/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Requires at least two arguements:\n\t'author/repo_name' \n\t'file regex'"
    exit 1
fi

URL=$(curl -s "https://api.github.com/repos/$1/releases/latest" \
| grep -P "browser_download_url.*$2" \
| cut -d : -f 2,3 \
| tr -d \" \
| tr -d " ")

echo "url: $URL"
CUT=""
if [[ -n "$3" ]]; then
    CUT=$(echo "$URL" | grep -i "$3")
fi

rc=0
if [[ -z "$CUT" ]]; then
    wget "$URL"
else
    echo "Nothing to download, negative match found"
    rc=1
fi

exit $rc
