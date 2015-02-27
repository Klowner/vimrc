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

    endfunction
"}}}
Plug 'bling/vim-airline', "{{{
	let g:airline#extensions#tabline#enabled = 1
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
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'

call plug#end()

