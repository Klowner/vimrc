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

let mapleader = " "
let maplocalleader = " "

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


" Attempt to put backup files in /run/user/$UID/vim
function! DetermineBackupDirectory()
    let l:dirpath=expand("/run/user/$UID")
    if isdirectory(l:dirpath)
        if !isdirectory(l:dirpath . 'vim')
            mkdir(l:dirpath . 'vim')
        endif
        let &backupdir=l:dirpath . 'vim'
    endif
endfunction

call DetermineBackupDirectory()

" Quick vim config edits
nnoremap <leader>ve :split $MYVIMRC<CR>
nnoremap <leader>veb :split ~/.vim/configs/basic.vim<CR>
nnoremap <leader>vec :split ~/.vim/configs/custom.vim<CR>
nnoremap <leader>vep :split ~/.vim/configs/plugins.vim<CR>
