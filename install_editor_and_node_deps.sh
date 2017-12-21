#!/bin/bash

echo "Beginning the installation of node dependencies"

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g eslint eslint-plugin-import eslint-plugin-react babel-eslint prettier
echo "=================================================="

echo "Installing pip dependencies for vim"
pip install flake-8 autopep8
echo "=================================================="
echo
echo "DONE"


