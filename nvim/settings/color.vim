if !exists('g:vscode')
  if has('nvim-0.4')
    lua require'colorizer'.setup()
  endif
endif
