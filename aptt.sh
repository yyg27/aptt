#!/usr/bin/env bash

packages=$(apt-cache pkgnames)

selection=$(echo "$packages" | sort -u | fzf --multi --preview 'apt-cache show {1}' --preview-window=down:75% --layout=reverse)

[[ -z "$selection" ]] && exit

xargs -r sudo apt install -y <<<"$selection"
