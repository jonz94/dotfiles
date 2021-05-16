" language server protocol

if !exists('g:vscode')
  if has('nvim-0.5')
    " main plugin
    silent! Plug 'neovim/nvim-lspconfig'

    " automatic install languague server
    silent! Plug 'jonz94/nvim-lspinstall', { 'branch': 'windows' }
  endif
endif
