" tmux

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

" vim-tmux-navigator
silent! Plug 'christoomey/vim-tmux-navigator'

" tmux.conf
autocmd BufNewFile,BufRead *.tmux.conf set syntax=tmux
