" language server protocol

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

if has('nvim-0.5')
  " main plugin
  silent! Plug 'neovim/nvim-lspconfig'

  " automatic install languague server
  silent! Plug 'jonz94/nvim-lspinstall', { 'branch': 'windows' }
endif
