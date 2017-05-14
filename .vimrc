set nocompatible                  " Must come first because it changes other options.
filetype off                      " Necessary on some Linux distros for pathogen to properly load bundles

" *********************************************
" *          Vundle - Vim Plugins             *
" *********************************************
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/L9.git'
Plugin 'vim-scripts/matchit.zip'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-dispatch'
Plugin 'janko-m/vim-test'
Plugin 'majutsushi/tagbar'
Plugin 'ngmy/vim-rubocop'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'rizzatti/dash.vim'
Plugin 'mattn/emmet-vim'
Plugin 'bogado/file-line'
Plugin 'ayu-theme/ayu-vim'
Plugin 'milkypostman/vim-togglelist'
Plugin 'slashmili/alchemist.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'itchyny/lightline.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'szw/vim-maximizer'
Plugin 'itspriddle/vim-marked'
Plugin 'sheerun/vim-polyglot'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'gregsexton/MatchTag'

call vundle#end()

syntax enable
filetype plugin indent on         " load file type plugins + indentation

" *********************************************
" *                 Settings                  *
" *********************************************
set encoding=utf-8

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set showmatch                     " Show matching brackets/parenthesis

set nowrap                        " don't wrap lines
set tabstop=2 shiftwidth=2        " a tab is two spaces (or set this to 4)
set expandtab                     " use spaces, not tabs (optional)
set backspace=indent,eol,start    " backspace through everything in insert mode"
set autoindent                    " match indentation of previous line
set pastetoggle=<F2>

set incsearch                     " Find as you type search
set hlsearch                      " Highlight search terms
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set foldmethod=syntax             "fold based on indent
set foldnestmax=3                 "deepest fold is 3 levels
set nofoldenable                  "dont fold by default

set hidden                        " Handle multiple buffers better.
set title                         " Set the terminal's title
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline                    " Highlight current line
set colorcolumn=81
set list listchars=tab:»·,trail:· " Display extra whitespace
set wildmode=list:longest         " Complete files like a shell.
set wildmenu                      " Enhanced command line completion.
set wildignore=*.o,*.obj,*~       " Stuff to ignore when tab completing
set novisualbell
set noerrorbells
set history=1000                  " Store lots of :cmdline history

set scrolloff=3
set sidescrolloff=7

set splitbelow
set splitright

"set mouse-=a
"set mousehide
set ttymouse=xterm2
set sidescroll=1

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=/tmp                " Keep swap files in one location
set timeoutlen=500

set laststatus=2                  " Show the status line all the time
set autowrite

set t_Co=256                      " Set terminal to 256 colors
set background=dark
let ayucolor="dark"
colorscheme ayu

autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufRead,BufNewFile *.thor set filetype=ruby

autocmd Filetype gitcommit setlocal spell textwidth=72

" Allow stylesheets to autocomplete hyphenated words
autocmd FileType css,scss,sass setlocal iskeyword+=-

" *********************************************
" *                 Functions                 *
" *********************************************

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

""" FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    execute 'colorscheme ' . g:colors_name
  endif
endfunc

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" *********************************************
" *               Key Bindings                *
" *********************************************
let mapleader = ","

" Toggle Folding
nnoremap <leader>f za

" Clear last search highlighting
nnoremap <Space> :noh<cr>

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Open the definition in a new split
nnoremap <c-\> <c-w>g<c-]>

" puts the caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>

" Convert old hash to new Ruby 1.9 syntax
map <leader>: :%s/:\(\w\+\)\(\s*=>\s*\)/\1: /gc<CR>

" indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" rename current file
map <leader>n :call RenameFile()<cr>

" File tree browser - backslash
map \ :NERDTreeToggle<CR>
" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<CR>

" vim-test
nmap <silent> <leader>R :TestFile -strategy=basic<CR>
nmap <silent> <leader>r :TestNearest -strategy=basic<CR>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
nmap <silent> <leader>. :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "dispatch"

"Run Ruby code analyzer
let g:vimrubocop_keymap = 0
map <leader><leader> :RuboCop<cr>

nnoremap <silent> <Leader>? :TagbarToggle<CR>

map <leader>gg :topleft :split Gemfile<cr>

nmap <silent> <leader>d <Plug>DashSearch
nmap <silent> <leader>D <Plug>DashGlobalSearch

" Toggles the quickfix window.
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

" *********************************************
" *           Plugin Customization            *
" *********************************************

" ctrlp.vim
let g:ctrlp_match_window = 'max:15'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" vim-indent-guides
let g:indent_guides_guide_size = 1

set guifont=Source\ Code\ Pro:h16
set antialias                     " MacVim: smooth fonts.
set guioptions-=T                 " Hide toolbar.
set background=dark               " Background.
set go-=m go-=T go-=l go-=L go-=r go-=R go-=b go-=F

:imap jj <Esc>

" insert blank line
nnoremap <leader>o o<esc>
nnoremap <Leader>O O<esc>

" Move lines up and down
map <c-j> :m +1 <CR>
map <c-k> :m -2 <CR>

nmap <space> /                    " Search (forwards)
map <c-space> ?                   " Search (backwards)
nnoremap <leader><space> :noh<cr> " turn search highlight off

" *********************************************
" *        Local Vimrc Customization          *
" *********************************************
if filereadable($HOME . "/dotfiles-local/vimrc.local")
  source ~/dotfiles-local/vimrc.local
endif
