#!/bin/bash

set -e # Exit immediately if a command fails

# --- Install kitty if not installed ---
if ! command -v kitty >/dev/null 2>&1; then
  echo "Kitty is not installed. Installing..."
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
else
  echo "Kitty is already installed."
fi

# --- Make kitty the default terminal (if running on a Debian-like system) ---
if command -v update-alternatives >/dev/null 2>&1; then
  echo "Setting kitty as the default terminal..."
  sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator "$(command -v kitty)" 50
else
  echo "update-alternatives not found — skipping default terminal setup."
fi

# --- Copy your kitty config ---
echo "Copying kitty config..."
rm -rf ~/.config/kitty
mkdir -p ~/.config
cp -r ../configs/kitty ~/.config/kitty

echo "Kitty installed and config imported successfully."
