if exists('g:vscode')
  finish
endif

augroup NoMatchParenInInsertMode
  autocmd!
  autocmd InsertEnter * set matchpairs=
  autocmd InsertLeave * set matchpairs=(:),{:},[:]
augroup END
