# These are my dotfiles which currently is set up for developing javascript with vim.

I'll probably update this in the future if I have to work with another language. This is sufficient enough a setup to replace vscode. This setup has linting and autocomplete enabled.

## Steps to make this work for javascript

1. Git clone
2. Run install.sh
2. Run PlugInstall in Vim
3. Run npm install on tern for vim (this is for autocompletion)
4. Ensure that python dependencies are installd as well (https://github.com/Valloric/YouCompleteMe/) (Basically just follow the instructions from the documentation)
5. Install eslint, eslint-plugin-react babel-eslint(this is for async await) globally
6. Install Powerline Fonts for vim 'https://github.com/powerline/fonts'
7. When starting a new project, make an eslintrc file and either soft link the eslintrc file to its json counterpart or just rename the json file to eslintrc


## Make bash look good with base16-shell
1. Download base-16 shell scripts
2. Follow instructions on the documentation to install and ensure that terminal supports 256 colors
3. Use base16_default-dark for a theme thats easy on the eyes

## Things to Note
1. Compile vim from source with both python dependencies as per documentation from YouCompleteMe page.
2. Use the adobe source pro font instsalled from the fonts for vim-powerline/airline. Gives abit of margin between lines. It helps to make reading code from line to line easier

## Compiling vim
1. Compile as per YouCompleteMe docs.
2. Only link 2.7.13 library from pyenv/version/2.7.13/config during compile BUT python 3 as per normal.

#Enjoy!
