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
Plug 'tpope/vim-sensible'

Plug 'bling/vim-airline', "{{{
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme = 'luna'
"}}}

Plug 'tpope/vim-fugitive', "{{{

"}}}
"
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

