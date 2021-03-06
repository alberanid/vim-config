" Configuration file for vim
"
" Davide Alberani's vimrc
"
" Davide Alberani <da@erlug.linux.it> (C) 2013-2018
" Released under the terms of the CC BY-SA license:
" https://creativecommons.org/licenses/by-sa/4.0/
"
" Info and instructions: https://github.com/alberanid/vim-config

" Main settings
set nocompatible
set updatetime=300
set encoding=utf-8
set viminfo=!,'100,\"1000,c
set history=1000
set undolevels=1000
set suffixes=.bak,~,.swp,.o,.out,.pyc,.pyo
set dictionary=/usr/share/dict/italian,/usr/share/dict/american-english
set directory=~/tmp,/tmp,.
let myfiletypefile = "~/.vim/filetypes.vim"

" Activate pathogen
filetype off
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Timeout
set ttimeout
set ttimeoutlen=200

" Buffers
set hidden
set nobackup
set nomodeline
"set modelines=1
"set autowrite
"set exrc

" Tabs, indentation, wrapping, movements
set tabstop=8
set smarttab
set copyindent
set autoindent
set backspace=indent,eol,start
set joinspaces
set textwidth=0
set nostartofline
set whichwrap=b,s,h,l

" Appearance, terminal integration
set ruler
set laststatus=2
set scrolloff=1
set showcmd
set ttyfast
set mouse=
set title
set icon
set noshowmode
set switchbuf=usetab,newtab
set noerrorbells
set wildmenu
"set cursorline

" Search
set incsearch
set ignorecase
set infercase
set smartcase
set showmatch
set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Folding
set foldmethod=syntax
set foldlevel=99

" Line numbers
" set number
" set numberwidth=5

" Commands and aliases
com Decrypt %!gpg --decrypt
com Crypt %!gpg -a -se
com Sign %!gpg --clearsign
com -bang W w<bang>
com -bang Q q<bang>
com -bang Wq wq<bang>
com -bang WQ wq<bang>
com -bang Qa qa<bang>
com -bang QA qa<bang>

"function! QuitOrLclose()
    "if &buftype == 'quickfix'
        "lclose
    "else
        "quit
    "endif
"endfunction

"cabbrev q call QuitOrLclose()


" Mappings
map Q gq
:nnoremap <silent> <F2> :YRShow<CR>
nnoremap <silent> <F4> :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <silent> <F5> :setlocal spell!<CR>
inoremap <silent> <F5> <C-\><C-O>:setlocal spell!<CR>
nnoremap <F8> :TagbarToggle<CR>
set pastetoggle=<F9>
nnoremap <silent> <F10> :UndotreeToggle<CR>
" Make p in Visual mode replace the selected text with the " register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" supertab
let g:SuperTabLongestEnhanced = 1
"let g:SuperTabLongestHighlight = 1

" UltiSnips
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ultisnips_python_style="sphinx"

" UltiSnips + YouCompleteMe + SuperTab
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Tagbar
let g:tagbar_left=1
let g:tagbar_autoclose = 1

" ALE
let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}
let g:ale_open_list = 1
let g:ale_list_window_size = 3
" fix a VIM bug that prevents the cursor to being shown; for now, I've set updatetime to 300 as a workaround
"let g:ale_echo_cursor = 0

" Airline
" Be sure to have your TERM environment variable set to xterm-256color
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let airline#extensions#tabline#ignore_bufadd_pat = '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'

" undotree
if has("persistent_undo")
  set undodir=~/vim/undodir/
  set undofile
endif

" delimitMate
autocmd FileType python let b:delimitMate_nesting_quotes = ['"', "'"]

" yankring
let g:yankring_max_history = 1000
let g:yankring_min_element_length = 2
let g:yankring_history_dir = '$HOME/.vim,$HOME'

" EasyGrep
let g:EasyGrepCommand = 1

" Terminals and color schemes
if &term =~ "xterm-debian" || &term =~ "xterm-color" || &term =~ "xterm-xfree86" || &term =~ "linux"
  set t_Co=16
  set t_Sf=^[[3%dm
  set t_Sb=^[[4%dm
endif

if &t_Co > 2 || has("gui_running")
  set background=dark
  syntax on
  "let g:solarized_termcolors=256
  colorscheme solarized
  "colorscheme koehler
  "colorscheme dracula
endif

" Autocommands
if has("autocmd")
  filetype plugin on
  filetype indent on

  " Debian-specific
  augroup filetype
    au BufRead reportbug.*                set ft=mail
    au BufRead reportbug-*                set ft=mail
  augroup END

  " Auto-close scratch window (comment out the second, to leave
  " it open until you exit the insert-mode)
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 

  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
endif " has ("autocmd")

