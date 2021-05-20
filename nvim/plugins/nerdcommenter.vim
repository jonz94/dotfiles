" nerd commenter

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

silent! Plug 'preservim/nerdcommenter'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
