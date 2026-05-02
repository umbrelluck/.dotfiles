!# /bin/bash

sudo freshclam

# locations=("boot" "dev" "etc" "lost+found" "mnt" "opts" "proc" "root" "run" "snap" "srv" "sys" "timeshift" "tmp" "usr" "var")


locations=$(ls /)
ignore=("bin" "lib")

for loc in $locations; do
    skip=0
    for ign in "${ignore[@]}"; do
        [[ "$loc" == *"$ign"* ]] && skip=1 && break
    done

    if [[ $skip -eq 0 ]]; then
        echo "Scanning $loc..."
        sudo clamscan -ri "/$loc" | sudo tee "virus.$loc"
    fi
done


echo "Scanning $HOME..."
clamscan -ri "$HOME" > virus.home

echo "Scanning lost..."
clamscan -ri "/home/lost+found" > virus.lost
