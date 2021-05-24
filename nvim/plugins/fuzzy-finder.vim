" fuzzy finder

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

if has('nvim-0.5')
  " use telescope for neovim nightly
  silent! Plug 'nvim-lua/popup.nvim'
  silent! Plug 'nvim-lua/plenary.nvim'
  silent! Plug 'nvim-telescope/telescope.nvim'
elseif has('nvim')
  " use fzf for neovim stable
  silent! Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  silent! Plug 'junegunn/fzf.vim'
else
  " use ctrlp for vim
  silent! Plug 'ctrlpvim/ctrlp.vim'
endif
