vim.keymap.set('n', '<Leader>ln', function()
  require('jonz94.line-number').toggle()
end, { noremap = true })
