" syntax highlight

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

if has('nvim-0.5')
  silent! Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  silent! Plug 'nvim-treesitter/playground'
else
  " all in one syntax highlight
  silent! Plug 'sheerun/vim-polyglot'

  " yaml
  silent! Plug 'stephpy/vim-yaml'
endif
