" Meine VIM-Config :)

set nocompatible
call pathogen#infect()

" SYSTEM
set viminfo='100,/0,:20,<0,@0,s10,h,rA:,rB:
set nobackup
set noswapfile
set nowb
set undolevels=1337
set history=1337
set autoread
set hidden
set autochdir

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
set so=7

" SEARCH
set hlsearch
set incsearch
set ignorecase
set smartcase

" VISUAL
if has("gui_running")
  set term=xterm
  set guifont=Source\ Code\ Pro\ Light:h12
  let g:airline_powerline_fonts = 1
  set guioptions=i
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

" DESIGN
set title
set number
set ruler
set showcmd
set laststatus=2
set statusline=\ %F%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
set cursorline
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

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
function! GUIOptionsToggle()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction
inoremap jk <Esc>
map <F1> <Esc>:call GUIOptionsToggle()<cr>
map <F2> <ESC>:NERDTreeToggle<RETURN>
set wildmenu
set wildmode=longest:list,full
nnoremap <BS> <ESC>:noh<RETURN><ESC>
nnoremap <SPACE> <ESC>/

" EOF :)
