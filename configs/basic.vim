"  _               _
" | |__   __ _ ___(_) ___
" | '_ \ / _` / __| |/ __|
" | |_) | (_| \__ \ | (__
" |_.__/ \__,_|___/_|\___|
"

set history=700
set background=dark

filetype plugin on
filetype indent on

syntax enable

set autoread                        " Carry over indenting from previous line
set wildmenu                        " Handy autocompletion menu

set list
set listchars=tab:→\ ,trail:←,extends:»,precedes:«
set infercase                       " Completion recognizes capitalisation
set smartcase                       " Derp
set ignorecase                      " Case insensitivity
set incsearch                       " Search as you type

set backupdir=~/tmp
set modelines=5
set matchtime=1
set modeline

"if isdirectory(expand("/run/user/$UID"))
"    if !isdirectory(expand("/run/user/$UID"))
"        call mkdir(expand("/usr/user/$UID/vim"))
"    endif
"    set backupdir=:call expand("/run/user/$UID/vim")
"endif
