function! config#after() abort
  :imap ii <Esc>

  :nnoremap Y y$

  :nnoremap # $
  :nnoremap $ 0

  :vnoremap # $
  :vnoremap $ 0

  set fillchars+=vert:\ 
  set clipboard+=unnamedplus

  set guicursor+=n:hor20-Cursor/lCursor
endfunction
