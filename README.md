# These are my dotfiles which currently is set up for developing javascript with vim. 

I'll probably update this in the future if I have to work with another language. This is sufficient enough a setup to replace vscode. Autocomplete support for es6 modules aren't working yet so you'll have to know modules APIs by heart or constantly refer to the docs.

## Steps to make this work for javascript

1. Git clone
2. Run install.sh
2. Run PlugInstall in Vim
3. Run npm install on tern for vim (this is for autocompletion)
4. Ensure that python dependencies are installd as well (https://github.com/Valloric/YouCompleteMe/) (Basically just follow the instructions from the documentation.)
5. Install eslint globally along 
6. Install Powerline Fonts for vim 'https://github.com/powerline/fonts'
7. When starting a new project, make an eslintrc file and either soft link the eslintrc file to its json counterpart or just rename the json file to eslintrc


## Make bash look good with base16-shell
1. Download base-16 shell scripts
2. Follow instructions on the documentation to install and ensure that terminal supports the correct colours.

## Things to Note
1. Use vim.nox-py2 instead of normal vim so that ulti snips does not conflict with You complete me 
2. Use the adobe source pro font instsalled from the fonts for vim-powerline/airline. Gives abit of margin between lines. It helps to make reading code from line to line easier.

#Enjoy!
