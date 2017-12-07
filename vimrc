"Vim Plug
set nocompatible "This is required for plugins to work
call plug#begin('~/.vim/plugged')
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'alvan/vim-closetag'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-sort-motion'
Plug 'danro/rename.vim'
Plug 'davidhalter/jedi-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'heavenshell/vim-pydocstring'
Plug 'justinmk/vim-syntax-extra'
Plug 'kien/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'tell-k/vim-autopep8'
Plug 'ternjs/tern_for_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'mitermayer/vim-prettier', {
      \ 'do': 'npm install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'lambdalisue/vim-pyenv', {
      \ 'depends': ['davidhalter/jedi-vim'],
      \ 'autoload': {
      \   'filetypes': ['python', 'python3'],
      \ }}
call plug#end()

" General settings
filetype plugin indent on "Turns on filetype, plugins and indentation on
set noswapfile "Turn off swap files
set rtp+=~/.vim/plugged "This is needed for UltiSnips

"Plugins
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx" "Vim close-tags
let g:NERDTreeHijackNetrw=0 "Prevent Nerd Tree from opening on Start

"Editor config config
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" vim-jsx
let g:jsx_ext_required = 0 "Disable the need for .jsx file extension

"Airline for vim
set laststatus=2
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1

" All other languages
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Indentation for Javascript
autocmd FileType javascript.jsx set tabstop=2 softtabstop=2  shiftwidth=2 textwidth=80 expandtab

" Indentation Python
autocmd FileType python set tabstop=8 softtabstop=4 shiftwidth=4 expandtab

" Indentation C
autocmd FileType c set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=80 expandtab formatoptions=tqc

" Markdown preview
let vim_markdown_preview_github=1

" DelimitMate
let delimitMate_expand_cr=1

" Indentline
let g:indentLine_char = '|'

" Make backspace work normal editors
set backspace=2

" Editor Theme
colorscheme base16-default-dark
let base16colorspace=256
set number
set relativenumber
syntax enable
let g:javascript_plugin_jsdoc = 1

"General Key Mappings
"Buffer jump next and previous
nmap <C-o> :bnext<CR>
nmap <C-i> :bprevious<CR>
nmap <F9>  :cprevious<CR>
nmap <F10> :cnext<CR>


"Jsdoc
autocmd FileType javascript.jsx nmap <silent> <C-u> <Plug>(jsdoc)
autocmd FileType javascript.jsx nmap <F7> :! clear && babel-node  %<CR>

"Leader key
let mapleader = ","

" Auto Indent for files
map <C-l> mzgg=G`z

" Save files using control s
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

" Remap escape insert mode
:inoremap jj <esc>

" This is for easier access of commands
map ; :

" Markdown previewer
let vim_markdown_preview_hotkey='<C-m>'
map <C-g> :NERDTreeToggle<CR>

" Tabs
map <C-m> :tabnew<CR>
map <leader>o :tabnext<CR>
map <leader>i :tabprevious<CR>

" Python keys
" Jedi
autocmd FileType python map <leader><leader>d :call jedi#goto_definitions()<CR>
autocmd FileType python map <leader><leader>g :call jedi#goto_assignments()<CR>
autocmd FileType python map <leader><leader>r :call jedi#rename()<CR>
autocmd FileType python map <leader><leader>n :call jedi#usages()<CR>
" Run current python script from within vim
autocmd FileType python nmap <F7> :! clear && python %<CR>
" Auto Fix python script using autopep8
autocmd FileType python noremap <buffer> <C-l> :call Autopep8()<CR>

" Javascript keys
autocmd FileType javascript.jsx map<leader><leader>d :YcmCompleter GoToDefinition<CR>
autocmd FileType javascript.jsx map<leader><leader>g :YcmCompleter GetDoc<CR>

"C
autocmd FileType c map<leader><leader>d :YcmCompleter GoTo<CR>
autocmd FileType c map<leader><leader>t :YcmCompleter GetType<CR>
autocmd FileType c map<leader><leader>g :YcmCompleter GetDoc<CR>
autocmd FileType c map<leader><leader>l :YcmCompleter FixIt<CR>

"Prettier
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
let g:prettier#config#trailing_comma = 'all'
" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'flow'
"Prettier Async
autocmd BufWritePre *.js,*.jsx,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_python_flake8_args='--ignore=E501,E266,E116E501,W293,F405,F403,F401'
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '❌'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

" Auto Pep 8
let g:autopep8_ignore="E501,E266,E116E501,W293,F405,F403,F401"
let g:autopep8_disable_show_diff=1

" YouCompleteMe
" C completion
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 "Prevent YCM from asking everytime we open a directory containing this file

"Vim Multiple Cursors
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-h>'

"ControlP
set wildignore+=**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*,**/public/images/*,*.pyc

"Ternjs
autocmd CompleteDone * pclose "Not sure What this does currently

"Vim Fugititve
map <leader>s :Gstatus<CR>
map <leader>f :Gdiff<CR>
map <leader>c :Gcommit<CR>
map <leader>b :Gblame<CR>

"Ulti Snips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsSnippetsDir = $HOME/'.vim/plugged/UltiSnips'
let g:UltiSnipsUsePythonVersion = 2

"JSDocs
let g:jsdoc_allow_input_prompt = 1

"vimpydoc
nmap <silent> <C-k> <Plug>(pydocstring)

"Jedi
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = "<C-j>"

"Tmux
let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

"Custom Scripts

"Create/Open file in current folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

"Create folders on file save
augroup Mkdir
  autocmd!
  autocmd BufWritePre *
        \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
        \ endif
augroup END

"Nerd Tree ignore
let NERDTreeIgnore = ['\.pyc$']

"CtrlP auto cache clearing.
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction

" Remove whitespaces on save saving cursor position
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
endif

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let major_version = pyenv#python#get_internal_major_version()
    call jedi#force_py_version(major_version)
  endfunction
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
endif
