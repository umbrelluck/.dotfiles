#!/usr/bin/env zsh

if [[ -z "$1" ]] then
    DIRS=($ZDOTDIR/.zsh/plugins $GITDIR $SCRSDIR)
else
    DIRS=("$1")
fi

CURRENT_DIR=`pwd`

for dir in "${DIRS[@]}"; do
    echo -e "\033[1;33mChecking $dir\033[0m"
    for repo in "${dir}/"*; do
        if [[ -d "${repo}/.git" ]] then
            cd "${repo}"
            echo -e "\033[1;36mFound git repository in $repo\033[0m"
            git fetch
            if [[ -n `git remote | grep upstream` ]] then
                echo -e "\033[1;32mFetching upstream changes for $repo\033[0m"
                git fetch upstream
            fi
        fi
    done
done

cd "${CURRENT_DIR}"
