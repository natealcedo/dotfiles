#!/usr/bin/bash
echo "Installing base16 for shells"
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

echo "Symlinking rc files"
./makesymlinks.sh

echo "Installing node and dependencies"
./install_editor_and_node_deps.sh

echo "Building vim from source"
./install-vim.sh

echo "\nRemember to install fonts"
