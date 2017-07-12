"----------------------------Setup for vm -------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/plugged

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
"---------------------------Vim Plug------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'edkolev/tmuxline.vim'
Plug 'davidhalter/jedi-vim'
Plug 'lambdalisue/vim-pyenv'
Plug 'heavenshell/vim-jsdoc'
Plug 'alvan/vim-closetag'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-sort-motion'
Plug 'danro/rename.vim'
Plug 'kien/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'ternjs/tern_for_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'posva/vim-vue'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'heavenshell/vim-pydocstring'
Plug 'mitermayer/vim-prettier', {
	\ 'do': 'yarn install',
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

call plug#end()

"----------------------------------Airline for vim----------------------
set laststatus=2
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
"-----------------------------------Basic Indenting------------------------
" Javascript
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

"Python
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

let delimitMate_expand_cr=1
let g:indentLine_char = '|'
set backspace=2 " make backspace work like most other apps

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
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
map <C-g> :NERDTreeToggle<CR>
nmap <F7> :! clear && python %<CR>

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
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--rcfile=/home/nate/.pylintrc'

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

"----------------------------Vim Fugititve-------------------------------
map <leader>s :Gstatus<CR>
map <leader>f :Gdiff<CR>
map <leader>c :Gcommit<CR>

"---------------------------------disable swapfile-------------------------
set noswapfile

"---------------------------------------Ulti snips---------------------
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/plugged/UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsUsePythonVersion = 2

"-------------------------------------Create/open file in curren folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

"--------------------------Create folders on file save
augroup Mkdir
  autocmd!
  autocmd BufWritePre *
        \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
        \ endif
augroup END

"----------------------JSDocs----------------------
nmap <silent> <C-i> <Plug>(jsdoc)
let g:jsdoc_allow_input_prompt = 1
"---------------------vimpydoc--------------------------
nmap <silent> <C-k> <Plug>(pydocstring)
"-----------python---------------------------
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = "<C-j>"
" autocmd FileType python setlocal completeopt-=preview

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
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
endif

"-----------------------------------Syntax--------------------------------------
let g:jsx_ext_required = 0
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js"

"---------------------Prettier-------------------------------------
" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 80

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'false'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true'

" none|es5|all
let g:prettier#config#trailing_comma = 'none'

" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'flow'

autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync

" Remove whitespaces on save saving cursor position
" =================================================

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
