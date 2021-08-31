" syntax highlight

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

if has('nvim-0.5')
  if $IS_TRIGGERD_BY_AUTOMATED_TASK == 'yes'
    silent! Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdateSync' }
  else
    silent! Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  endif
  silent! Plug 'nvim-treesitter/playground'
else
  " all in one syntax highlight
  silent! Plug 'sheerun/vim-polyglot'

  " yaml
  silent! Plug 'stephpy/vim-yaml'
endif
