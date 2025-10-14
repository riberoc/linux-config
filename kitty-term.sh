#!/bin/bash

# Install kitty
sudo apt install kitty -y

# Ensure the config directory exists
mkdir -p ~/.config/kitty

# Move your config
mv -f ./configs/kitty.conf ~/.config/kitty/kitty.conf

# Set kitty as the default terminal non-interactively
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 50
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty
