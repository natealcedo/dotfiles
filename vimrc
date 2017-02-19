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
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive'
Plug 'ruanyl/vim-fixmyjs'
Plug 'scrooloose/nerdtree'

call plug#end()


"--------------------------------emmet-vim--------------------------
let g:user_emmet_leader_key='<C-E>'

"----------------------------------Airline for vim----------------------
set laststatus=2
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
"-----------------------------------Basic Indenting------------------------
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
let delimitMate_expand_cr=1
let g:indentLine_char = '|'

"------------------------------------Theme---------------------------------
syntax enable
let base16colorspace=256 
colorscheme base16-default-dark
"-----------------------------------Basic Settings------------------------

let g:NERDTreeHijackNetrw=0
filetype plugin indent on
set number
set relativenumber
set path+=*
"--------------------------------KeyMappings--------------------------------
:inoremap jj <esc>
let mapleader = ","
map <C-l> mzgg=G`z
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
map ; :
map <C-b> :NERDTreeToggle<CR>

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
let g:multi_cursor_quit_key='<C-h>'

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

"-------------------Custom Script---------------------
" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
    if exists("g:loaded_ctrlp") && g:loaded_ctrlp
        augroup CtrlPExtension
            autocmd!
            autocmd FocusGained  * CtrlPClearCache
            autocmd BufWritePost * CtrlPClearCache
        augroup END
    endif
endfunction
if has("autocmd")
    autocmd VimEnter * :call SetupCtrlP()
endif

"-----------------------------------Syntax--------------------------------------
let g:jsx_ext_required = 0

"-----------------------------------Fix my js---------------------------------
let g:fixmyjs_engine = 'eslint'
noremap <c-m> :Fixmyjs<CR>
let g:fixmyjs_rc_path = '~/.eslintrc.json'
