#!/bin/bash

(( EUID != 0 )) && echo "run as root or with sudo please" && exit 1

if ! pacman -Qqs devtools > /dev/null 2>&1; then
    echo "devtools must be installed, run pacman -Sy devtools first"
    exit 2
fi

archs=('i686' 'x86_64')
repos=()

for config in pacman-*.conf; do
    reponame=${config//pacman-/}
    reponame=${reponame//.conf/}
    repos+=("$reponame")
    install -m 0644 "$config" /usr/share/devtools/"$config"
done

(
cd /usr/bin
for repo in "${repos[@]}"; do
    for arch in "${archs[@]}"; do
        [[ ! -L "$repo-$arch-build" ]] && ln -s archbuild "$repo-$arch-build"
    done
done
)

exit 0
