" Meine VIM-Config :)

set nocompatible
call pathogen#infect()

" VIM ECOSYSTEM
set viminfo='100,/0,:20,<0,@0,s10,h,rA:,rB:
set nobackup
set noswapfile
set nowb
set undolevels=1337
set history=1337
set autoread
set hidden
set autochdir
if has("clipboard")
	set clipboard=unnamed
endif
if has("unnamedplus")
	set clipboard+=unnamed
endif

" EDITOR BEHAVIOUR
syntax on
set encoding=utf-8
set ff=unix
set ffs=unix,dos,mac
set backspace=indent,eol,start
set nowrap
set textwidth=0
set wrapmargin=0
set linebreak
set tabstop=4
set softtabstop=4
set shiftwidth=0
set noexpandtab
set whichwrap=b,s,<,>
set so=7
set wildmenu
set wildmode=longest:list,full
set hlsearch
set incsearch
set ignorecase
set smartcase

" EDITOR DESIGN
set title
set number
set ruler
set showcmd
set laststatus=2
set cursorline
set noerrorbells visualbell t_vb=
set showmatch
set mat=1
autocmd GUIEnter * set visualbell t_vb=
set statusline=\ %F%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" TERMINAL DESIGN
if has("nvim")
	set guifont=Consolas:h13
	call rpcnotify(0, "Gui", "Option", "Tabline", 0)
	call rpcnotify(0, "Gui", "Option", "Popupmenu", 0)
else
	if has("gui_running")
		set term=xterm
		if has("unix")
			set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
		else
			set guifont=Source\ Code\ Pro\ Light:h12
		endif
		let g:airline_powerline_fonts = 1
		set guioptions=i
	else
		set term=xterm-256
		set t_Co=256
	endif
endif
syntax enable
set background=dark
colorscheme molokai
if has('mouse')
	set mouse=a
endif

" BONUS MAPPINGS
let mapleader=","
inoremap jk <Esc>
map <F3> <ESC>:set wrap!<RETURN>
nnoremap <BS> <ESC>:noh<RETURN><ESC>
nnoremap <LEFT> <ESC>:bp<RETURN>
nnoremap <RIGHT> <ESC>:bn<RETURN>
nnoremap <UP> <ESC><C-Y>
nnoremap <DOWN> <ESC><C-E>

" BONUS COMMANDS
command! -range JsonFormatSelectedRange <line1>,<line2>call FormatWithJsonTool()

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'commit': '8c533e34eacf310a0babbcdf6c512a08eb447389' }
Plug 'junegunn/fzf.vim', { 'commit': '1fcdee55cc5975d67248b2f8ea5fbac9aa628b7c' }
Plug 'jiangmiao/auto-pairs', { 'commit': '39f06b873a8449af8ff6a3eee716d3da14d63a76' }
Plug 'altercation/vim-colors-solarized', { 'commit': '528a59f26d12278698bb946f8fb82a63711eec21' }
Plug 'vim-airline/vim-airline', { 'commit': 'c7a633ce8f4547e680377efe8ea70493fcce1349' }
call plug#end()

" PLUGIN MAPPINGS
nnoremap <C-P> <ESC>:FZF<RETURN>
nnoremap <TAB> <ESC>:Buffers<RETURN>
nnoremap <S-TAB> <ESC>:Tags<RETURN>

" PLUGIN CONFIGURATIONS
let g:netrw_liststyle = 3
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#show_tab_type=1

" ADDITIONAL COMFORT

" Distraction free gVim
map <F1> <Esc>:call GUIOptionsToggle()<cr>
function! GUIOptionsToggle()
	if &guioptions=='i'
		exec('set guioptions=imTrL')
	else
		exec('set guioptions=i')
	endif
endfunction

" Light-dark-switch
map <F2> <Esc>:call FontAndBGToggle()<cr>
function! FontAndBGToggle()
	if &background=='dark'
		if has("gui_running")
			if has("unix")
				set guifont=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold\ 12
			else
				set guifont=Source\ Code\ Pro\ Semibold:h12
			endif
		endif
		colorscheme solarized
		set background=light
	else
		if has("gui_running")
			if has("unix")
				set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
			else
				set guifont=Source\ Code\ Pro\ Light:h12
			endif
		endif
		colorscheme molokai
		set background=dark
	endif
endfunction

map <F8> <Esc>:call RunMyCurrentFile()<cr>
function! RunMyCurrentFile()
	write
	execute '!python %'
endfunction

function! FormatWithJsonTool() range
    execute a:firstline . "," . a:lastline . "!python -m json.tool"
endfunction

"" Enable Windows Copy-n-Paste, Control-Q is now block select
"map <C-V> "+gP
"cmap <C-V> <C-R>+
"vnoremap <C-X> "+x
"vnoremap <C-C> "+y
"noremap <C-Q> <C-V>

" CODE
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
" EOF :)
