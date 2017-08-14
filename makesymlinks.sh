#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

dir=~/dotfiles                    # dotfiles directory
files="bashrc vimrc pylintrc tmux.conf vim gitconfig tern-config gitvim cleanvim"    # list of files/folders to symlink in homedir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files
do
  echo "Creating symlink to $file in home directory."
  echo "$dir/$file"
  ln -s $dir/$file ~/.$file
done

echo "Making UltiSnips Directory"
cd $dir/vim/plugged/ && mkdir UltiSnips
cd $dir
echo "Transferring Snippets"
cp  $dir/javascript.snippets $dir/vim/plugged/UltiSnips/
cp  $dir/python.snippets $dir/vim/plugged/UltiSnips/
cd $dir/vim && rm -rf ./vim ./.vim # I dont know why the vim files are being copied
echo "Done"
