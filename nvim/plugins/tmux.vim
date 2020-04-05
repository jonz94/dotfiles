" tmux

if !exists('g:vscode')
  " vim-tmux-navigator
  silent! Plug 'christoomey/vim-tmux-navigator'

  " tmux.conf
  autocmd BufNewFile,BufRead *.tmux.conf set syntax=tmux
endif
