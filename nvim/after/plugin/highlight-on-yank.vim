augroup HighlightOnYank
  autocmd!
  autocmd TextYankPost * lua require('jonz94.on-yank').highlight()
augroup END
