" color visualizer

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

if has('nvim-0.4')
  silent! Plug 'norcalli/nvim-colorizer.lua'
else
  silent! Plug 'ap/vim-css-color'
endif
