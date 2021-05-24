" language server protocol

" ignore this file if neovim is running inside vscode or neovim is not 0.5+
if exists('g:vscode') || !has('nvim-0.5')
  finish
endif

" main plugin
silent! Plug 'neovim/nvim-lspconfig'

" automatically install languague server
silent! Plug 'jonz94/nvim-lspinstall', { 'branch': 'windows' }

" automatically change the current working directory
silent! Plug 'ahmedkhalf/lsp-rooter.nvim'
