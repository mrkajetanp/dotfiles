set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if !exists('g:vscode')
    source ~/.vimrc
else
    call plug#begin('~/.vim/plugged')
    Plug 'easymotion/vim-easymotion'
    Plug 'unblevable/quick-scope'
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-surround'                         " Change surrounding marks
    call plug#end()

    filetype plugin on

    let mapleader = "\<Space>"
    noremap <Leader>q :wq

    :nnoremap Y y$
    
    :nnoremap # $
    :nnoremap $ 0

    :vnoremap # $
    :vnoremap $ 0

    set clipboard+=unnamedplus
endif
