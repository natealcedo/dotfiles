"---------------------------Vim Plug------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'jelera/vim-javascript-syntax'
Plug 'Raimondi/delimitMate'
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-eunuch'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'danro/rename.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'chriskempson/base16-vim'

call plug#end()

"-------------------------------FuzzyFileFinder--------------------
set runtimepath^=~/.vim/plugged/ctrlp.vim

"--------------------------------emmet-vim--------------------------
let g:user_emmet_leader_key='<C-E>'

"----------------------------------Powerline for vim----------------------
set rtp+=/usr/local/lib/python3.5/dist-packages/powerline/bindings/vim/
set laststatus=2
set nocompatible              
filetype off                 

"-----------------------------------Basic Indenting------------------------
let g:indentLine_char = '|'
let delimitMate_expand_cr=1

"------------------------------------Theme---------------------------------
syntax enable
let base16colorspace=256 
colorscheme base16-default-dark
"-----------------------------------Basic Settings------------------------

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber

"--------------------------------KeyMappings--------------------------------
:inoremap jj <esc>

"--------------------------------UI Shit-------------------------------------
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar


"----------------------------------Linting----------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

"-----------------------------vim-multipl-cursors--------------------------------
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"--------------------------------ternjs---------------------------------
autocmd CompleteDone * pclose

"---------------------------------disable swapfile-------------------------
set noswapfile
