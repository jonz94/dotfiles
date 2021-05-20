" terminal

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

if has('nvim')
  " do not show line number on terminal window (for neovim)
  autocmd TermOpen * setlocal nonumber norelativenumber
else
  " do not show line number on terminal window (for vim)
  autocmd TerminalOpen * setlocal nonumber norelativenumber
endif
