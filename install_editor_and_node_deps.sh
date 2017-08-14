#!/bin/bash

echo "Beginning the installation of node dependencies"

#TODO Get the script from nodejs.org to install node
sudo npm install -g eslint eslint-plugin-import eslint-plugin-react babel-eslint
echo "=================================================="

echo "Installing pip dependencies for vim"
pip install flake-8 autopep8 pylint
echo "=================================================="
echo
echo "DONE"


