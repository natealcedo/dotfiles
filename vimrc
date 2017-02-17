"----------------------------Setup for vim -------------------------------
set nocompatible              
filetype off                 
set rtp+=~/.vim/plugged
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
Plug 'ternjs/tern_for_vim'
Plug 'danro/rename.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'duggiefresh/vim-easydir'

call plug#end()


"--------------------------------emmet-vim--------------------------
let g:user_emmet_leader_key='<C-E>'

"----------------------------------Airline for vim----------------------
set laststatus=2
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1

"-----------------------------------Basic Indenting------------------------
let g:indentLine_char = '|'
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"------------------------------------Theme---------------------------------
syntax enable
let base16colorspace=256 
colorscheme base16-default-dark
"-----------------------------------Basic Settings------------------------

filetype plugin indent on
set number
set relativenumber

"--------------------------------KeyMappings--------------------------------
:inoremap jj <esc>
let mapleader = ","

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

"----------------------------controlp------------------------------------
set wildignore+=**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*,**/public/images/*
"--------------------------------ternjs---------------------------------
autocmd CompleteDone * pclose

"---------------------------------disable swapfile-------------------------
set noswapfile

"---------------------------------------Ulti snips---------------------
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/plugged/UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

"-------------------------------------Create/open file in curren folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

