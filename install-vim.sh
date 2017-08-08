#!/bin/bash

echo "Beginning Installation of Vim"
echo "===============================\n"
cd ~
echo "Cloning git from repository"
echo "===============================\n"
git clone https://github.com/vim/vim.git
cd vim
echo "Configuring Vim"
echo "===============================\n"
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/home/nate/opt/pyenv/versions/2.7.13/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
echo "Configuring Done. Making VIMRUNTIMEDIR"
echo "===============================\n"
make VIMRUNTIMEDIR=/usr/share/vim/vim80
echo "Making vim run time done. Installing vim"
echo "===============================\n"
cd ~/vim
sudo make install
echo "Installation Done. Updating vim alternatives"
echo "===============================\n"
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
cd ~ && rm -rf ./vim
echo "Installing vim plugins"
echo "===============================\n"
vim -E -c PlugInstall -c q
echo "\n Script done!"
