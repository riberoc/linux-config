#!/bin/bash
set -e

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Please select a distro option: 'kali' or 'ubuntu'"
  exit 1
fi

# --- Install kitty if not installed ---
if ! command -v kitty >/dev/null 2>&1; then
  echo "Kitty is not installed. Installing..."
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
else
  echo "Kitty is already installed."
fi

# --- Distro specific setup ---
if [ "$1" = "kali" ]; then
  ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
  cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/
  echo 'kitty.desktop' >~/.config/xdg-terminals.list
  xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>t" -s "kitty"

elif [ "$1" = "ubuntu" ]; then
  if command -v update-alternatives >/dev/null 2>&1; then
    echo "Setting kitty as the default terminal..."
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator "$(command -v kitty)" 50
  else
    echo "update-alternatives not found — skipping default terminal setup."
  fi

else
  echo "Invalid option. Use: 'kali' or 'ubuntu'"
  exit 1
fi

# --- Copy kitty config ---
echo "Copying kitty config..."
rm -rf ~/.config/kitty
mkdir -p ~/.config
cp -r ../configs/kitty ~/.config/kitty

echo "Kitty installed and config imported successfully."
