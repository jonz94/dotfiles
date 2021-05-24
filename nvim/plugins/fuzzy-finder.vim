" fuzzy finder

" ignore this file if neovim is running inside vscode or neovim is 0.5+
if exists('g:vscode') || has('nvim-0.5')
  finish
endif

" ctrlp
silent! Plug 'ctrlpvim/ctrlp.vim'
