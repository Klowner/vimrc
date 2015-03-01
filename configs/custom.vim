" vim:fdm=marker:ts=4:sw=4:et:
"                 _
"   ___ _   _ ___| |_ ___  _ __ ___
"  / __| | | / __| __/ _ \| '_ ` _ \
" | (__| |_| \__ \ || (_) | | | | | |
"  \___|\__,_|___/\__\___/|_| |_| |_|
"
"
" Section: Color Schemes {{{1

function! ColorSchemeMolokai()
    set background=dark
    let g:molokai_original = 0
    let g:rehash256 = 1
    try
        colo molokai
    catch
    endtry
    highlight SpecialKey cterm=None ctermfg=235 ctermbg=None

    hi SignColumn ctermbg=232
    hi LineNr ctermbg=232 ctermfg=236
endfunction

function! ColorTermSolarized()
    set background=dark
    let g:solarized_termcolors = 256
    let g:solarized_contrast = "high"
    let g:solarized_termtrans = 1
    try
        colo solarized
    endtry
    highlight SpecialKey cterm=None ctermfg=234 ctermbg=None
endfunction

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

call ColorSchemeMolokai()

" Section: Spellcheck {{{1
"" spell check all git commit messages

"" underline misspelings
hi clear SpellBad
hi SpellBad cterm=underline

map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s

