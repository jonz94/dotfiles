" color visualizer

" ignore this file if neovim is running inside vscode
if exists('g:vscode')
  finish
endif

if has('nvim-0.4')
  lua require'colorizer'.setup()
endif
