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

" Section: Helpful Functions {{{1

" highlight trailing whitespace with garish color
function! HighlightExtraWhitespace()
    highlight ExtraWhitespace ctermfg=red
    match ExtraWhitespace /\s\+$/
    highlight SpecialKey ctermbg=None
endfunction

" trim all trailing whitespace
function! StripExtraWhitespace()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" Section: Keybindings {{{1

let mapleader = " "
let maplocalleader = " "

"" buffa flippin'
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>

"" ctrl-o sort in visual mode
vmap <C-o> :sort<CR>

"" toggle folds with <Return>
nnoremap <CR> za

"" magically fix indentation
map <F7> mzgg=G`z<CR>

"" toggle line numbers
nmap <leader>n :set invnumber<CR>

"" don't exist visual mode when shifting
vnoremap < <gv
vnoremap > >gv

" Section: Visual tweaks {{{1
" Section: Spellcheck {{{1
"" spell check all git commit messages

"" underline misspelings
hi clear SpellBad
hi SpellBad cterm=underline

