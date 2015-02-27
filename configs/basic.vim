set history=700
set background=dark

filetype plugin on
filetype indent on

set autoread                        " Carry over indenting from previous line
set wildmenu

syntax enable

set list
set listchars=tab:→\ ,trail:←,extends:»,precedes:«
set infercase                       " Completion recognizes capitalisation
set smartcase                       " Derp
set ignorecase                      " Case insensitivity
set incsearch                       " Search as you type
