" vim:fdm=marker:ts=4:sw=4:et:
"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" Scott's .vimrc file
"

" Section: Vundle {{{1
"--------------------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'Solarized'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'luochen1990/rainbow'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-signify'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jistr/vim-nerdtree-tabs'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
if has('gui_running')
    set background=dark
    colorscheme solarized
else
 "   set background=dark
 "       colorscheme solarized
endif
" Section: Key mappings {{{1
"--------------------------------------------------------------------------

"macros
map <silent> <C-n> :NERDTreeToggle<CR>

" Why not use the space or return keys to toggle folds?
nnoremap <space> za
nnoremap <CR> za
vnoremap <space> zf

" Section: Hacks {{{1
"--------------------------------------------------------------------------

" Make j & k linewise {{{2

" turn off linewise keys -- normally, the `j' and `k' keys move the cursor down
" one entire line. with line wrapping on, this can cause the cursor to actually
" skip a few lines on the screen because it's moving from line N to line N+1 in
" the file. I want this to act more visually -- I want `down' to mean the next
" line on the screen
map j gj
map k gk

" having Ex mode start or showing me the command history
" is a complete pain in the ass if i mistype
map Q <silent>
map q: <silent>
map K <silent>
"map q <silent>

" Make the cursor stay on the same line when window switching {{{2

function! KeepCurrentLine(motion)
    let theLine = line('.')
    let theCol = col('.')
    exec 'wincmd ' . a:motion
    if &diff
        call cursor(theLine, theCol)
    endif
endfunction

nnoremap <C-w>h :call KeepCurrentLine('h')<CR>
nnoremap <C-w>l :call KeepCurrentLine('l')<CR>
" Section: Vim options {{{1
"--------------------------------------------------------------------------


set tags=/home/escogib/tags/*ctags
set autoindent              " Carry over indenting from previous line
set autoread                " Don't bother me hen a file changes
set autowrite               " Write on :next/:prev/^Z
set backspace=indent,eol,start
                            " Allow backspace beyond insertion point
set cindent                 " Automatic program indenting
set cinkeys-=0#             " Comments don't fiddle with indenting
set cino=(0                 " Indent newlines after opening parenthesis
set commentstring=\ \ #%s   " When folds are created, add them to this
set copyindent              " Make autoindent use the same chars as prev line
set directory-=.            " Don't store temp files in cwd
set encoding=utf8           " UTF-8 by default
set expandtab               " No tabs
set fileformats=unix,dos,mac  " Prefer Unix
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,fold:-,diff:┄
                            " Unicode chars for diffs/folds, and rely on
                            " Colors for window borders
silent! set foldmethod=marker " Use braces by default
set formatoptions=tcqn1     " t - autowrap normal text
                            " c - autowrap comments
                            " q - gq formats comments
                            " n - autowrap lists
                            " 1 - break _before_ single-letter words
                            " 2 - use indenting from 2nd line of para
set hidden                  " Don't prompt to save hidden windows until exit
set history=200             " How many lines of history to save
set hlsearch                " Hilight searching
set ignorecase              " Case insensitive
set incsearch               " Search as you type
set infercase               " Completion recognizes capitalization
set laststatus=2            " Always show the status bar
set linebreak               " Break long lines by word, not char
set list                    " Show invisble characters in listchars
set listchars=tab:▶\ ,trail:◀,extends:»,precedes:«
                            " Unicode characters for various things
set matchtime=2             " Tenths of second to hilight matching paren
set modelines=5             " How many lines of head & tail to look for ml's
silent! set mouse=nvc       " Use the mouse, but not in insert mode
set nobackup                " No backups left after done editing
set nonumber                " No line numbers to start
set visualbell t_vb=        " No flashing or beeping at all
set nowritebackup           " No backups made while editing
set printoptions=paper:letter " US paper
set ruler                   " Show row/col and percentage
set scroll=4                " Number of lines to scroll with ^U/^D
set scrolloff=15            " Keep cursor away from this many chars top/bot
set shiftround              " Shift to certain columns, not just n spaces
set shiftwidth=4            " Number of spaces to shift for autoindent or >,<
set shortmess+=A            " Don't bother me when a swapfile exists
set showbreak=              " Show for lines that have been wrapped, like Emacs
set showmatch               " Hilight matching braces/parens/etc.
set sidescrolloff=3         " Keep cursor away from this many chars left/right
set smartcase               " Lets you search for ALL CAPS
set softtabstop=4           " Spaces 'feel' like tabs
set suffixes+=.pyc          " Ignore these files when tab-completing
set tabstop=4               " The One True Tab
set notitle                 " Don't set the title of the Vim window
set wildmenu                " Show possible completions on command line
set wildmode=list:longest,full " List all options and complete
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules  " Ignore certain files in tab-completion

" Section: Commands & Functions {{{1
"--------------------------------------------------------------------------
cmap w!! w !sudo tee >/dev/null %

" trim spaces at EOL
command! TEOL %s/ \+$//
command! CLEAN retab | TEOL


" Section: Python specifics {{{1
"--------------------------------------------------------------------------

if has('python')
python << EOF
import os
import sys
sys.path.append(os.path.join(os.getenv('HOME'), '.vim', 'python'))
EOF
endif

" Section: CSCOPE {{{1
"--------------------------------------------------------------------------
if filereadable("/home/escogib/tags/upc.cscope")
    cs add /home/escogib/tags/upc.cscope
endif

if filereadable("/home/escogib/tags/up.cscope")
    cs add /home/escogib/tags/up.cscope
endif

if filereadable("/home/escogib/tags/bbmc.cscope")
    cs add /home/escogib/tags/bbmc.cscope
endif

if filereadable("/home/escogib/tags/elib.cscope")
    cs add /home/escogib/tags/elib.cscope
endif

if filereadable("/home/escogib/tags/bbi.cscope")
    cs add /home/escogib/tags/bbi.cscope
endif

" Section: Plugin Specific {{{1
"--------------------------------------------------------------------------

" NERD_tree.vim
let NERDTreeIgnore = ['\~$', '\.pyc$']
let NERDTreeShowBookmarks = 1
let NERDTreeDirArrows = 0
let g:Powerline_symbols = 'compatible'
" Powerline
if has('gui_running')
  let NERDTreeDirArrows = 1
  set laststatus=2
  set encoding=utf-8
  set t_Co=256
  let g:Powerline_symbols = 'unicode'
  "let g:Powerline_symbols = 'fancy'
endif
let g:ctrlp_map = '<c-p>'

" Section: Experimental {{{1
"--------------------------------------------------------------------------

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
