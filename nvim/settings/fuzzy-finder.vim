" fuzzy finder

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

if has('nvim-0.5')
  " telescope key mapping
  nnoremap <C-p> :Telescope fd<CR>
elseif has('nvim')
  " fzf key mapping
  nnoremap <C-p> :Files<CR>
endif
