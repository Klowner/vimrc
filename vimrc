" vim:fdm=marker:ts=4:sw=4:et:
"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" Mark's .vimrc
"------------------------------"

" Section: Basic Configuration {{{1

set runtimepath+=~/.vim

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
            call mkdir(l:dirpath . 'vim')
        endif
        let &backupdir=l:dirpath . 'vim'
    endif
endfunction

call DetermineBackupDirectory()

" Quick vim config edits
nnoremap <leader>ve :split $MYVIMRC<CR>

" Section: VIM-PLUG Installation {{{1
"
" Install VIM-PLUG
if !filereadable(expand('~/.vim/autoload/plug.vim'))
    echo "Installing vim-plug..."
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" Here come the plugins...
call plug#begin('~/.vim/plugged')

"-----------------------------------------
" Syntax
"-----------------------------------------
Plug 'ap/vim-css-color',      { 'for': ['css', 'less', 'sass'] }
Plug 'nono/vim-handlebars',   { 'for': 'handlebars' }
Plug 'groenewege/vim-less',   { 'for': 'less' }
Plug 'othree/html5.vim',      { 'for': 'html' }
Plug 'tpope/vim-markdown',    { 'for': 'markdown' }
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } "{{{
    let g:javascript_conceal_function   = "ƒ"
"}}}

"-----------------------------------------
" Color Schemes
"-----------------------------------------
Plug 'tomasr/molokai'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'

"-----------------------------------------
" Functionality
"-----------------------------------------
Plug 'Shougo/unite.vim' "{{{
    autocmd FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#sorter_default#use(['sorter_rank'])
        call unite#custom#profile('files', 'context.smartcase', 1)
        call unite#custom#source('line,outline', 'matchers', 'matcher_fuzzy')

        call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git',
            \ 'google/obj/',
            \ 'dist/',
            \ 'node_modules/',
            \ 'tmp/'
            \ ], '\|'))
        nmap <buffer> <C-j> <Plug>(unite_select_next_line)
        nmap <buffer> <C-k> <Plug>(unite_select_prev_line)
        nmap <buffer> <Esc> <Plug>(unite_exit)
    endfunction

    Plug 'Shougo/neomru.vim'           " Required for file_mru
    Plug 'Shougo/unite-session'        " Provides session (project) support
    Plug 'Shougo/unite-outline'

    let g:unite_data_directory=&backupdir . '/unite'
    let g:unite_source_history_yank_enable = 1
    let g:unite_source_rec_max_cache_files=5000

    nmap ; [unite]
    nnoremap [unite] <nop>

    nnoremap <silent> [unite] :Unite -toggle -no-split -buffer-name=files -start-insert file_rec/async:!<CR>

    nnoremap <leader>/ :Unite grep:.<CR>
    "nmap <C-y> [unite]y

    " Use silver searcher if available
    if executable('ag')
        let g:unite_source_rec_async_command= 'ag --nocolor --nogroup --hidden -g ""'
    else
        echom "Silver Searcher is unavailable, unite results will probably be irritating"
    endif

    Plug 'Shougo/unite-outline' "{{{
        nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<CR>
    "}}}
"}}}
Plug 'bling/vim-airline', "{{{
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols = {}
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_theme = 'luna'
"}}}
Plug 'tpope/vim-fugitive', "{{{
    map \b :Gblame<CR>
    map \l :Glog<CR>
"}}}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } "{{{
    let NERDTreeQuitOnOpen = 0
    let NERDTreeShowLineNumbers = 0
    nmap \e :NERDTreeToggle<CR>
"}}}
Plug 'Shougo/neocomplete.vim' "{{{
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
    inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : "<S-tab>"
"}}}
Plug 'scrooloose/syntastic' "{{{
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_jump=0
    let g:syntastic_javascript_jslint_conf = "--nomen"
    let g:syntastic_javascript_checkers = ['jshint', 'jscs']
"}}}
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'gregsexton/gitv'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'scrooloose/nerdcommenter' " <leader>cc comment, <leader>cu uncomment

call plug#end()

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

" Section: Read .vimlocal if available {{{1
if filereadable(expand('~/.vimlocal'))
    source ~/.vimlocal
endif

