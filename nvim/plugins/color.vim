if !exists('g:vscode')
  if has('nvim-0.4')
    silent! Plug 'norcalli/nvim-colorizer.lua'
  else
    silent! Plug 'ap/vim-css-color'
  endif
endif
