# This vimrc set up works for both Python and Javascript at the moment.

## NOTE:
Do not use a default vim package from apt if you plan on working with python. They will break with pyenv.
Instead, compile your own version from source. This has the benefit of having clipboard installed as well
since the package from apt does not. Another benefit is that vim 8 is installed.

## Compiling vim and making it work with pyenv
1. Install pyenv first and get those dependencies up.
2. Download vim from [github](https://github.com/vim/vim)
3. Compile as per the YouCompleteMe [documentation](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source).
4. However under the configure call, link python-config-dir to home/nate/opt/pyenv/versions/:versionNumber/lib/:pythonVersion/config (this is so pyenv wont break vim)

```
cd ~
git clone https://github.com/vim/vim.git
cd vim
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
make VIMRUNTIMEDIR=/usr/share/vim/vim80
```

## Instrcutions on how to get this up and running

1. Install pyenv first
2. Git clone
3. Run install.sh
4. Run PlugInstall in Vim
5. Run Install.py with the right arguments in YouCompleteMe for autocompletion
6. Run npm install on tern for vim (this is for autocompletion)
7. Install flake-8, autopep8, eslint, eslint-plugin-import, eslint-plugin-react babel-eslint(this is for async await) globally
8. Install Powerline Fonts for vim 'https://github.com/powerline/fonts'
9. When starting a new project, make an eslintrc file and either soft link the eslintrc file to its json counterpart or just rename the json file to eslintrc

## Make bash look good with base16-shell
1. Download base-16 shell scripts
2. Follow instructions on the documentation to install and ensure that terminal supports 256 colors
3. Use base16_default-dark for a theme thats easy on the eyes

## Things to Note
1. Use the adobe source pro font instsalled from the fonts for vim-powerline/airline. Gives abit of margin between lines. It helps to make reading code from line to line easier

## Side things to do with ubuntu 16.04 and dell xps 13 9360
1. If bluetooth doesnt work. Run this in the terminal as root.
`echo "options ath10k_core skip_otp=y" > /etc/modprobe.d/ath10k.conf`

#Enjoy!
