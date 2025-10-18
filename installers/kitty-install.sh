#!/bin/bash

# Install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Make kitty the default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which kitty) 50

# Add your config
rm -rf ~/.config/kitty
cp -r ../configs/kitty ~/.config/kitty

echo "Kitty installed and config imported"
