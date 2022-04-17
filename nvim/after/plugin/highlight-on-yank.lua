vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    require('jonz94.on-yank').highlight()
  end,
  group = vim.api.nvim_create_augroup('HighlightOnYank', { clear = true }),
})
