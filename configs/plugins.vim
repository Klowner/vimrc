" vim:fdm=marker:ts=4:sw=4:et:
"         _             _
"   _ __ | |_   _  __ _(_)_ __  ___
"  | '_ \| | | | |/ _` | | '_ \/ __|
"  | |_) | | |_| | (_| | | | | \__ \
"  | .__/|_|\__,_|\__, |_|_| |_|___/
"  |_|            |___/
"
"
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
" Section: Syntax {{{1
Plug 'ap/vim-css-color',      { 'for': ['css', 'less', 'sass'] }
Plug 'othree/html5.vim',      { 'for': ['html'] }
Plug 'nono/vim-handlebars',   { 'for': 'handlebars' }
Plug 'tpope/vim-markdown',    { 'for': 'markdown' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } "{{{
    let g:javascript_conceal_function   = "ƒ"
"}}}

"-----------------------------------------
" Section: Color Schemes {{{1
Plug 'tomasr/molokai'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'

"-----------------------------------------
" Section: Functionality {{{1
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

    let g:unite_data_directory='~/tmp/unite'
    let g:unite_source_history_yank_enable = 1
    let g:unite_source_rec_max_cache_files=5000

    nmap ; [unite]
    nnoremap [unite] <nop>

    nnoremap <silent> [unite] :Unite -toggle -no-split -buffer-name=mixed buffer file_mru -start-insert file_rec/async<CR>

    nnoremap <leader>/ :Unite grep:.<CR>
    nmap <C-y> [unite]y



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
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

call plug#end()

