#!/usr/bin/env bash

#chech fzf
command -v fzf >/dev/null || { echo ":: Installing fzf..."; sudo apt update -qq && sudo apt install -y fzf; }

echo "Installing aptt tools..."

BASE_URL="https://raw.githubusercontent.com/yyg27/aptt/main"

sudo curl -sLo /usr/local/bin/aptt   "$BASE_URL/aptt.sh"   && sudo chmod +x /usr/local/bin/aptt
sudo curl -sLo /usr/local/bin/apttrm "$BASE_URL/apttrm.sh" && sudo chmod +x /usr/local/bin/apttrm

echo "Installation complete."