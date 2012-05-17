"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"activate pathogen

call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let mapleader = ","

if has('gui_running')
  let g:Powerline_symbols = 'fancy'
  set guifont=Menlo\ for\ Powerline:h11
end

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

filetype plugin indent on

set number      "show line numbers

"display tabs and trailing spaces
set list
"set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set listchars=tab:▸\ ,eol:¬

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile
    set colorcolumn=+1 "mark the ideal max text width
endif

syntax enable
set background=dark
colorscheme solarized

set laststatus=2

set formatoptions-=o "dont continue comments when pushing o/O
"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set t_Co=256

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif
set hidden

set foldmethod=syntax
