" VIM configurations

" VIMplug configuration
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
call plug#end()

map <C-n> :NERDTreeToggle<CR>

" Syntax highlighting
syntax on

" Line Numbers
set number

" Cursor line
set cursorline

" Enable mouse in all modes
set mouse=a

" Show the cursor position
set ruler

" Search configs
set hlsearch
set ignorecase
set incsearch

" Show the filename in the window titlebar
set title

" Centralize backups, swapfiles and undo history
"set backupdir=~/.vim/backups
"set directory=~/.vim/swaps
"if exists("&undodir")
"	set undodir=~/.vim/undo
"endif

" Optimize for fast terminal connections
set ttyfast

" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
" set softtabstop=2

" git-gutter-options
set updatetime=250

