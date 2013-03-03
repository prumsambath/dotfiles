set nocompatible               " Must come first because it changes other options.
filetype off                   " Necessary on some Linux distros for pathogen to properly load bundles

" *********************************************
" * Vundle - Vim Plugins *
" *********************************************
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'
Bundle 'mattn/zencoding-vim'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/L9.git'
Bundle 'vim-scripts/matchit.zip'
Bundle 'godlygeek/tabular'
Bundle 'git://gist.github.com/287147.git'

Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'

" *********************************************
" * Settings *
" *********************************************
set encoding=utf-8
syntax enable
filetype plugin indent on      " load file type plugins + indentation

set showcmd                    " Display incomplete commands.
set showmode                   " Display the mode you're in.
set showmatch                  " Show matching brackets/parenthesis

set nowrap                     " don't wrap lines
set tabstop=2 shiftwidth=2     " a tab is two spaces (or set this to 4)
set expandtab                  " use spaces, not tabs (optional)
set backspace=indent,eol,start " backspace through everything in insert mode"
set autoindent                 " match indentation of previous line
set pastetoggle=<F2>

set incsearch                  " Find as you type search
set hlsearch                   " Highlight search terms
set ignorecase                 " Case-insensitive searching.
set smartcase                  " But case-sensitive if expression contains a capital letter.

set foldmethod=indent          " fold based on indent
set foldnestmax=3              " deepest fold is 3 levels
set nofoldenable               " dont fold by default

set hidden                     " Handle multiple buffers better.
set title                      " Set the terminal's title
set number                     " Show line numbers.
set ruler                      " Show cursor position.
set cursorline                 " Show current line
set wildmode=list:longest      " Complete files like a shell.
set wildmenu                   " Enhanced command line completion.
set wildignore=*.o,*.obj,*~    " Stuff to ignore when tab completing
set novisualbell
set noerrorbells
set history=1000               " Store lots of :cmdline history
set virtualedit=all

set scrolloff=3
set sidescrolloff=7

set mouse-=a
set mousehide
set ttymouse=xterm2
set sidescroll=1

set cpoptions+=$
set nobackup                   " Don't make a backup before overwriting a file.
set nowritebackup              " And again.
set directory=/tmp             " Keep swap files in one location
set timeoutlen=500

set laststatus=2               " Show the status line all the time
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-18(\ %l,%c-%v\ %)%P

set t_Co=256 " Set terminal to 256 colors
set guifont=Monaco\ 11 
set background=dark
colorscheme vividchalk

" *********************************************
" * Key Bindings *
" *********************************************
let mapleader = ","

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Move lines up and down
map <c-j> :m +1 <CR>
map <c-k> :m -2 <CR>

" Insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>
" Shortcut for =>
imap <C-l> <Space>=><Space>
" Map ESC
imap jj <ESC>
" Search (forwards) 
nmap <space> /
" Search (backwards)
map <c-space> ?
nnoremap <leader><space> :noh<cr> " turn search highlight off

" Tabs
nmap <leader>tn :tabnew<CR>
nmap <leader>th :tabprevious<CR>
nmap <leader>tl :tabnext<CR>
nmap <leader>t0 :tabfirst<CR>
nmap <leader>t$ :tablast<CR>
nmap <leader>tc :tabclose<CR>

nmap <leader>nt :NERDTree<CR>

let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>" 

" Save and exit
"nmap <leader>q :q<CR>
nmap <leader>c :bd<CR>
nmap <leader>w :w!<CR>
imap <leader>w <ESC>:w!<CR>i
nmap <leader><Esc> :q!<CR>

imap <leader>A <ESC>A

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %

" *********************************************
" * Plugin Customization *
" *********************************************

"# ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " for Linux/MacOSX
let g:ctrlp_by_filename = 1 
