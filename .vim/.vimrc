" Meine VIM-Config :)

set nocompatible
call pathogen#infect()

" SYSTEM
set nobackup
set noswapfile
set nowb
set undolevels=1337
set history=1337
set autoread
set hidden

" TEXT BEHAVIOUR
set encoding=utf-8
set ff=unix
set ffs=unix,dos,mac
set backspace=indent,eol,start
set nowrap
set textwidth=0
set wrapmargin=0
set linebreak
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set whichwrap=b,s,<,>

" SEARCH
set hlsearch
set incsearch
set ignorecase
set smartcase

" VISUAL
if has("gui_running")
  set term=xterm
  set guifont=Consolas:h12
  set guioptions-=T
else
  set term=xterm-256
  set t_Co=256
endif
syntax enable
set background=dark
"colorscheme solarized
colorscheme mustang
"colorscheme gruvbox
if has('mouse')
  set mouse=a
endif
set showmatch
set mat=1
set cursorline
set cursorcolumn

" DESIGN
set title
set number
set ruler
set showcmd
set laststatus=2
"set statusline=\ %F%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" CODE
"syntax on
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd BufReadPost * " Remember cursor position 
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent
endif

" COMFORT
map <F2> <ESC>:NERDTreeToggle<RETURN>
