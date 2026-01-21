#!/usr/bin/env bash

packages=$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')

selection=$(echo "$packages" | sort -u | fzf --multi \
  --prompt="Select packages to REMOVE: " \
  --preview='apt-cache show {1} 2>/dev/null | grep -E "^(Package|Version|Description|Installed-Size)"' \
  --preview-window=right:60%:wrap \
  --layout=reverse)

[[ -z "$selection" ]] && exit

xargs -r sudo apt remove -y <<<"$selection"
