" syntax highlight

if !exists('g:vscode')
  if has('nvim-0.5')
    silent! Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  else
    " all in one syntax highlight
    silent! Plug 'sheerun/vim-polyglot'

    " yaml
    silent! Plug 'stephpy/vim-yaml'
  endif
endif
