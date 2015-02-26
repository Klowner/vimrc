" vim:fdm=marker:ts=4:sw=4:et:
"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"
"   Mark's little old .vimrc
"-----------------------------
"
set runtimepath+=~/.vim

source ~/.vim/configs/basic.vim
source ~/.vim/configs/plugins.vim
source ~/.vim/configs/custom.vim

if filereadable(expand('~/.vimlocal'))
    source ~/.vimlocal
endif
