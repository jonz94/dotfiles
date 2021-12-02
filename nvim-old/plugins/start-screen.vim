" start screen

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

if has('nvim')
  " use dashboard-nvim for neovim
  silent! Plug 'jonz94/dashboard-nvim', { 'branch': 'fix-session-save-on-windows' }
else
  " use vim-startify for vim
  silent! Plug 'mhinz/vim-startify'
endif
