" vim:fdm=marker:ts=4:sw=4:et:
"                 _
"   ___ _   _ ___| |_ ___  _ __ ___
"  / __| | | / __| __/ _ \| '_ ` _ \
" | (__| |_| \__ \ || (_) | | | | | |
"  \___|\__,_|___/\__\___/|_| |_| |_|
"
"
" Section: Color Scheme {{{1

set background=dark
colo molokai


" Section: Keybindings {{{1

let mapleader = " "
let maplocalleader = " "

nmap \e :NERDTreeToggle<CR>

"" buffa flippin'
map <C-e> :e#<CR>
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>

"" ctrl-o sort in visual mode
vmap <C-o> :sort<CR>

"" toggle folds with <Return>
nnoremap <CR> za

"" magically fix indentation
map <F7> mzgg=G`z<CR>


" Section: Visual tweaks {{{1

" highlight trailing whitespace with garish color
function! HighlightExtraWhitespace()
    highlight ExtraWhitespace ctermfg=red
    match ExtraWhitespace /\s\+$/
    highlight SpecialKey ctermbg=None
endfunction

